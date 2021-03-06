module NonlinearFitting

using CSV
using IterTools: fieldvalues
using Test
using Unitful, UnitfulAtomic

using EquationsOfState.Collections
using EquationsOfState.Collections: EOSParameters
using EquationsOfState.Fitting: nonlinfit

# Do not export! Only for internal use!
_isapprox(a::EOSParameters, b::EOSParameters; kwargs...) =
    isapprox(ustrip.(collect(fieldvalues(a))), ustrip.(collect(fieldvalues(b))); kwargs...)

@testset "Test fitting energy with different element types" begin
    result = BirchMurnaghan3rd(
        big(0.0057009512119028044),
        big(103.58772269057364),
        big(-144.45152457521132),
        big(-40.31992619868024),
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(1, 2, 3.0, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(1, 2, 3, 0)),
            [1, 2, 3, 4, 5.0],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(1, 2, 3.0, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7.0],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(1, 2, 3, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(big(1), 2, big(3), 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-4,
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(big(1), 2, 3, 0)),
            BigFloat[1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-4,
    )
    @test _isapprox(
        nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(big(1.0), 2, 3, 0)),
            [1, 2, 3, 4, 5],
            BigInt[5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-4,
    )
end

@testset "Test fitting pressure with different element types" begin
    result =
        BirchMurnaghan3rd(1.1024687826597717, 29.30861698140365, 12.689089871112746, 0.0)
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, 3.0, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-6,
    )
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, 3, 0)),
            [1, 2, 3, 4, 5.0],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-6,
    )
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, 3.0, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7.0],
        ),
        result;
        atol = 1e-6,
    )
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, 3, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-6,
    )
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, big(3), 0)),
            [1, 2, 3, 4, 5],
            BigInt[5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-6,
    )
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, big(3.0), 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-6,
    )
    @test _isapprox(
        nonlinfit(
            PressureEquation(BirchMurnaghan3rd(1, 2, big(3), 0)),
            [big(1), 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-6,
    )
end

@testset "Test fitting bulk modulus with different element types" begin
    result = BirchMurnaghan3rd(7.218928431312577, 5.007900469653902, 4.06037725509478, 0.0)
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3.0, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3, 0)),
            [1, 2, 3, 4, 5.0],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3.0, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7.0],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3, 0)),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3, big(0))),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3, big(0))),
            [1, 2, 3, big(4.0), 5],
            [big(5), 6, 9, 8, 7.0],
        ),
        result;
        atol = 1e-5,
    )
    @test _isapprox(
        nonlinfit(
            BulkModulusEquation(BirchMurnaghan3rd(1, 2, 3, big(0))),
            [1, 2, 3, 4, 5],
            [big(5), 6, 9, 8, 7.0],
        ),
        result;
        atol = 1e-5,
    )
end

# Data in the following tests are from
# https://github.com/materialsproject/pymatgen/blob/1f0957b8525ddc7d12ea348a19caecebe6c7ff34/pymatgen/analysis/tests/test_eos.py
@testset "Test data from Pymatgen" begin
    volumes = [
        25.987454833,
        26.9045702104,
        27.8430241908,
        28.8029649591,
        29.7848370694,
        30.7887887064,
        31.814968055,
        32.8638196693,
        33.9353435494,
        35.0299842495,
        36.1477417695,
        37.2892088485,
        38.4543854865,
        39.6437162376,
        40.857201102,
        42.095136449,
        43.3579668329,
        44.6456922537,
        45.9587572656,
        47.2973100535,
        48.6614988019,
        50.0517680652,
        51.4682660281,
        52.9112890601,
        54.3808371612,
        55.8775030703,
        57.4014349722,
        58.9526328669,
    ]
    energies = [
        -7.63622156576,
        -8.16831294894,
        -8.63871612686,
        -9.05181213218,
        -9.41170988374,
        -9.72238224345,
        -9.98744832526,
        -10.210309552,
        -10.3943401353,
        -10.5427238068,
        -10.6584266073,
        -10.7442240979,
        -10.8027285713,
        -10.8363890521,
        -10.8474912964,
        -10.838157792,
        -10.8103477586,
        -10.7659387815,
        -10.7066179666,
        -10.6339907853,
        -10.5495538639,
        -10.4546677714,
        -10.3506386542,
        -10.2386366017,
        -10.1197772808,
        -9.99504030111,
        -9.86535084973,
        -9.73155247952,
    ]
    @test _isapprox(
        nonlinfit(EnergyEquation(BirchMurnaghan3rd(40, 0.5, 4, 0)), volumes, energies),
        BirchMurnaghan3rd(
            40.98926572528106,
            0.5369258245417454,
            4.178644235500821,
            -10.842803908240892,
        ),
    )
    @test _isapprox(
        nonlinfit(EnergyEquation(Murnaghan(41, 0.5, 4, 0)), volumes, energies),
        Murnaghan(
            41.13757930387086,
            0.5144967693786603,
            3.9123862262572264,
            -10.836794514626673,
        ),
    )
    @test _isapprox(
        nonlinfit(EnergyEquation(PoirierTarantola3rd(41, 0.5, 4, 0)), volumes, energies),
        PoirierTarantola3rd(
            40.86770643373908,
            0.5667729960804602,
            4.331688936974368,
            -10.851486685041658,
        ),
    )
    @test _isapprox(
        nonlinfit(EnergyEquation(Vinet(41, 0.5, 4, 0)), volumes, energies),
        Vinet(
            40.916875663779784,
            0.5493839425156859,
            4.3051929654936885,
            -10.846160810560756,
        ),
    )
    # 'deltafactor': {'b0': 0.5369258245611414,
    #             'b1': 4.178644231924639,
    #             'e0': -10.842803908299294,
    #             'v0': 40.989265727927936},
    # 'numerical_eos': {'b0': 0.5557257614101998,
    #             'b1': 4.344039148405489,
    #             'e0': -10.847490826530702,
    #             'v0': 40.857200064982536},
    # }
end

@testset "Test Mg dataset" begin
    mp153_volumes = [
        16.69182365,
        17.25441763,
        17.82951915,
        30.47573817,
        18.41725977,
        29.65211363,
        28.84346369,
        19.01777055,
        28.04965916,
        19.63120886,
        27.27053682,
        26.5059864,
        20.25769112,
        25.75586879,
        20.89736201,
        25.02003097,
        21.55035204,
        24.29834347,
        22.21681221,
        23.59066888,
        22.89687316,
    ]
    mp153_energies = [
        -1.269884575,
        -1.339411225,
        -1.39879471,
        -1.424480995,
        -1.44884184,
        -1.45297499,
        -1.4796246,
        -1.49033594,
        -1.504198485,
        -1.52397006,
        -1.5264432,
        -1.54609291,
        -1.550269435,
        -1.56284009,
        -1.569937375,
        -1.576420935,
        -1.583470925,
        -1.58647189,
        -1.591436505,
        -1.592563495,
        -1.594347355,
    ]
    mp153_known_energies_vinet = [
        -1.270038831,
        -1.339366487,
        -1.398683238,
        -1.424556061,
        -1.448746649,
        -1.453000456,
        -1.479614511,
        -1.490266797,
        -1.504163502,
        -1.523910268,
        -1.526395734,
        -1.546038792,
        -1.550298657,
        -1.562800797,
        -1.570015274,
        -1.576368392,
        -1.583605186,
        -1.586404575,
        -1.591578378,
        -1.592547954,
        -1.594410995,
    ]
    fitted_eos =
        nonlinfit(EnergyEquation(Vinet(23, 0.5, 4, -2)), mp153_volumes, mp153_energies)
    @test _isapprox(
        fitted_eos,
        Vinet(
            22.95764559358769,
            0.2257091141420788,
            4.060543387224629,
            -1.5944292606251582,
        ),
    )
    @test isapprox(
        map(EnergyEquation(fitted_eos), mp153_volumes),
        mp153_known_energies_vinet;
        atol = 1e-5,
    )
end

@testset "Test Si dataset" begin
    mp149_volumes = [
        15.40611854,
        14.90378698,
        16.44439516,
        21.0636307,
        17.52829835,
        16.98058208,
        18.08767363,
        18.65882487,
        19.83693435,
        15.91961152,
        22.33987173,
        21.69548924,
        22.99688883,
        23.66666322,
        20.44414922,
        25.75374305,
        19.24187473,
        24.34931029,
        25.04496106,
        27.21116571,
        26.4757653,
    ]
    mp149_energies = [
        -4.866909695,
        -4.7120965,
        -5.10921253,
        -5.42036228,
        -5.27448405,
        -5.200810795,
        -5.331915665,
        -5.3744186,
        -5.420058145,
        -4.99862686,
        -5.3836163,
        -5.40610838,
        -5.353700425,
        -5.31714654,
        -5.425263555,
        -5.174988295,
        -5.403353105,
        -5.27481447,
        -5.227210275,
        -5.058992615,
        -5.118805775,
    ]
    mp149_known_energies_vinet = [
        -4.866834585,
        -4.711786499,
        -5.109642598,
        -5.420093739,
        -5.274605844,
        -5.201025714,
        -5.331899365,
        -5.374315789,
        -5.419671568,
        -4.998827503,
        -5.383703409,
        -5.406038887,
        -5.353926272,
        -5.317484252,
        -5.424963418,
        -5.175090887,
        -5.403166824,
        -5.275096644,
        -5.227427635,
        -5.058639193,
        -5.118654229,
    ]
    fitted_eos =
        nonlinfit(EnergyEquation(Vinet(20, 0.5, 4, -5)), mp149_volumes, mp149_energies)
    @test _isapprox(
        fitted_eos,
        Vinet(
            20.446696754873944,
            0.5516638521306302,
            4.324373909783161,
            -5.424963389876503,
        ),
    )
    @test isapprox(
        map(EnergyEquation(fitted_eos), mp149_volumes),
        mp149_known_energies_vinet;
        atol = 1e-5,
    )
end

@testset "Test Ti dataset" begin
    mp72_volumes = [
        12.49233296,
        12.91339188,
        13.34380224,
        22.80836212,
        22.19195533,
        13.78367177,
        21.58675559,
        14.23310328,
        20.99266009,
        20.4095592,
        14.69220297,
        19.83736385,
        15.16106697,
        19.2759643,
        15.63980711,
        18.72525771,
        16.12851491,
        18.18514127,
        16.62729878,
        17.65550599,
        17.13626153,
    ]
    mp72_energies = [
        -7.189983803,
        -7.33985647,
        -7.468745423,
        -7.47892835,
        -7.54945107,
        -7.578012237,
        -7.61513166,
        -7.66891898,
        -7.67549721,
        -7.73000681,
        -7.74290386,
        -7.77803379,
        -7.801246383,
        -7.818964483,
        -7.84488189,
        -7.85211192,
        -7.87486651,
        -7.876767777,
        -7.892161533,
        -7.892199957,
        -7.897605303,
    ]
    mp72_known_energies_vinet = [
        -7.189911138,
        -7.339810181,
        -7.468716095,
        -7.478678021,
        -7.549402394,
        -7.578034391,
        -7.615240977,
        -7.669091347,
        -7.675683891,
        -7.730188653,
        -7.74314028,
        -7.778175824,
        -7.801363213,
        -7.819030923,
        -7.844878053,
        -7.852099741,
        -7.874737806,
        -7.876686864,
        -7.891937429,
        -7.892053535,
        -7.897414664,
    ]
    fitted_eos = nonlinfit(EnergyEquation(Vinet(17, 0.5, 4, -7)), mp72_volumes, mp72_energies)
    @test _isapprox(
        fitted_eos,
        Vinet(
            17.13223026131245,
            0.7029766224730147,
            3.6388077563621812,
            -7.897414959124461,
        ),
    )
    @test isapprox(
        map(EnergyEquation(fitted_eos), mp72_volumes),
        mp72_known_energies_vinet;
        atol = 1e-5,
    )
end

# Data in the following tests are from
# https://github.com/aoterodelaroza/asturfit/tree/master/test
@testset "Test `w2k-lda-na.dat` from `Gibbs2`" begin
    data = CSV.read("data/w2k-lda-na.dat", comment = "#")

    @testset "without unit" begin
        volumes = data[:, 1]  # unit: bohr^3
        energies = data[:, 2]  # unit: Rydberg
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L117-L122
        @test _isapprox(
            nonlinfit(EnergyEquation(Murnaghan(224, 0.006, 4, -323)), volumes, energies),
            Murnaghan(224.501825, 0.00060479524074699499, 3.723835, -323.417686);
            atol = 1e-5,
        )
        # No reference data, I run on my computer.
        @test _isapprox(
            nonlinfit(EnergyEquation(BirchMurnaghan2nd(224, 0.0006, -323)), volumes, energies),
            BirchMurnaghan2nd(223.7192539523166, 0.0006268341030294977, -323.4177121144877);
            atol = 1e-3,
        )
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L15-L20
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(224, 0.0006, 4, -323)),
                volumes,
                energies,
            ),
            BirchMurnaghan3rd(224.444565, 0.00062506191050572675, 3.740369, -323.417714),
        )
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L30-L36
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan4th(224, 0.0006, 4, -5460, -323)),  # bohr^3, Ry/bohr^3, 1, bohr^3/Ry, Ry
                volumes,
                energies,
            ),
            BirchMurnaghan4th(
                224.457562,  # bohr^3
                0.0006229381129795094,  # Ry/bohr^3
                3.730992,
                -5322.7030547560435,  # bohr^3/Ry
                -323.417712,  # Ry
            );
            rtol = 1e-5,
        )
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L98-L105
        # @test _isapprox(
        #     nonlinfit(
        # EnergyEquation(        #         BirchMurnaghan5th(224.445371, 0.0006, 4, -5500, 3.884535907971559e7, -323)),
        #         volumes,
        #         energies,
        #     ),
        #     BirchMurnaghan5th(
        #         224.451813,
        #         0.0006228893043314733,
        #         3.736723,
        #         -5292.414119096362,
        #         6.3542116050611705e7,
        #         -323.417712,
        #     );
        #     atol = 1,
        # )  # FIXME: result is wrong
        # # No reference data, I run on my computer.
        # @test _isapprox(
        # EnergyEquation(        #     nonlinfit(Vinet(224, 0.0006, 4, -323)), volumes, energies),
        #     Vinet(
        #         224.45278665796354,
        #         0.0006313500637481759,
        #         3.7312381477678853,
        #         -323.4177229576912,
        #     ),
        # )
        # # FIXME: The result is rather wrong
        # @test _isapprox(
        # EnergyEquation(        #     nonlinfit(PoirierTarantola3rd(224, 0.0006, 4, -323)), volumes, energies),
        #     PoirierTarantola3rd(224.509208, 0.000635892264159838, 3.690448, -323.41773);
        #     atol = 1e-5,
        # )
        # # FIXME: This cannot go through
        # @test _isapprox(
        #     nonlinfit(
        # EnergyEquation(        #         PoirierTarantola4th(220, 0.0006, 3.7, -5500, -323)),
        #         volumes,
        #         energies,
        #     ),
        #     PoirierTarantola4th(
        #         224.430182,
        #         0.0006232241765069493,
        #         3.758360,
        #         -5493.859729817176,
        #         -323.417712,
        #     ),
        # )
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L98-L105
        @test _isapprox(
            nonlinfit(
                EnergyEquation(PoirierTarantola5th(224.445371, 0.0006, 3.8, -5500, 6e7, -323)),
                volumes,
                energies,
            ),
            PoirierTarantola5th(
                224.451250,
                0.000622877204137392,
                3.737484,
                -5283.999708607125,
                6.296000262990379e7,
                -323.417712,
            );
            rtol = 0.05,
        )
    end # testset

    @testset "with units" begin
        volumes = data[:, 1] .* u"bohr^3"
        energies = data[:, 2] .* u"Ry"
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L117-L122
        @test _isapprox(
            nonlinfit(
                EnergyEquation(Murnaghan(
                    224.445371 * u"bohr^3",
                    9.164446 * u"GPa",
                    3.752432,
                    -161.708856 * u"hartree",
                )),
                volumes,
                energies,
            ),
            Murnaghan(
                224.501825 * u"bohr^3",
                8.896845 * u"GPa",
                3.723835,
                -161.708843 * u"hartree",
            );
            atol = 1e-5,
        )
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L15-L20
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(
                    224.445371 * u"bohr^3",
                    9.164446 * u"GPa",
                    3.752432,
                    -161.708856 * u"hartree",
                )),
                volumes,
                energies,
            ),
            BirchMurnaghan3rd(
                224.444565 * u"bohr^3",
                9.194978 * u"GPa",
                3.740369,
                -161.708857 * u"hartree",
            ),
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan4th(
                    224.445371 * u"bohr^3",
                    9.164446 * u"GPa",
                    3.752432,
                    -0.371174 * u"1/GPa",
                    -161.708856 * u"hartree",
                )),
                volumes,
                energies,
            ),
            BirchMurnaghan4th(
                224.457562 * u"bohr^3",
                9.163736 * u"GPa",
                3.730992,
                -0.361830 * u"1/GPa",
                -161.708856 * u"hartree",
            );
            atol = 1e-1,
        )
        # See https://github.com/aoterodelaroza/asturfit/blob/0909b1468e44d691b0c7a44a5b583d170dd248ff/test/test03.out#L98-L105
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan5th(
                    224.445371 * u"bohr^3",
                    9.164446 * u"GPa",
                    3.752432,
                    -0.371174 * u"1/GPa",
                    0.179508 * u"1/GPa^2",
                    -161.708856 * u"hartree",
                )),
                volumes,
                energies,
            ),
            BirchMurnaghan5th(
                224.451813 * u"bohr^3",
                9.163018 * u"GPa",
                3.736723,
                -0.359771 * u"1/GPa",
                0.293634 * u"1/GPa^2",
                -161.708856 * u"hartree",
            );
            atol = 1,
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(PoirierTarantola3rd(
                    224.445371 * u"bohr^3",
                    9.164446 * u"GPa",
                    3.7,
                    -161.708856 * u"hartree",
                )),
                volumes,
                energies,
            ),
            PoirierTarantola3rd(
                224.509208 * u"bohr^3",
                9.354298 * u"GPa",
                3.690448,
                -161.708865 * u"hartree",
            );
            atol = 1e-5,
        )
    end
end

@testset "Test `w2k-lda-k.dat` from `Gibbs2`" begin
    data = CSV.read("data/w2k-lda-k.dat", comment = "#")

    @testset "without unit" begin
        volumes = data[:, 1]  # unit: bohr^3
        energies = data[:, 2]  # unit: Rydberg
        @test _isapprox(
            nonlinfit(EnergyEquation(Murnaghan(224, 0.0006, 4, -323)), volumes, energies),
            Murnaghan(
                435.05782299050884,
                0.00028297159355249787,
                3.5705032675000785,
                -1201.2082739321822,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(BirchMurnaghan2nd(224, 0.0006, -323)), volumes, energies),
            BirchMurnaghan2nd(
                430.10027687726716,
                0.000302451215462375,
                -1201.2083221436026,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(224, 0.0006, 4, -323)),
                volumes,
                energies,
            ),
            BirchMurnaghan3rd(
                432.67139080209046,
                0.00030508544859901674,
                3.7894868450211923,
                -1201.2083959943404,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan4th(432, 0.0003, 3.8, -11773, -1201)),
                volumes,
                energies,
            ),
            BirchMurnaghan4th(
                432.8012195854224,
                0.0003041889904166284,
                3.774020919355492,
                -11773.192574765615,
                -1201.2083912308235,
            );
            rtol = 1e-5,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(Vinet(432, 0.0003, 3.8, -1201)), volumes, energies),
            Vinet(
                432.04609865398015,
                0.0003137631070690569,
                3.837666939407128,
                -1201.2084453225773,
            );
            atol = 1e-3,
        )
    end # testset

    @testset "with units" begin
        volumes = data[:, 1] .* u"bohr^3"
        energies = data[:, 2] .* u"Ry"
        fitted_eos = nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(
                224 * u"bohr^3",
                0.0006 * u"Ry/bohr^3",
                4,
                -323 * u"Ry",
            )),
            volumes,
            energies,
        )
        @test _isapprox(
            fitted_eos,
            BirchMurnaghan3rd(
                432.6713907942206 * u"bohr^3",
                0.00030508544829126676 * u"Ry/bohr^3",
                3.789486849598267,
                -1201.208395994332 * u"Ry",
            ),
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(
                    224 * u"bohr^3",
                    10 * u"GPa",
                    3.75,
                    -161 * u"hartree",
                )),
                volumes,
                energies,
            ),
            BirchMurnaghan3rd(
                432.671390388525 * u"bohr^3",
                4.487961877912739 * u"GPa",
                3.7894868798185493,
                -600.6041979971637 * u"hartree",
            ),
        )
    end
end

@testset "Test `w2k-lda-li.dat` from `Gibbs2`" begin
    data = CSV.read("data/w2k-lda-li.dat", comment = "#")

    @testset "with unit" begin
        volumes = data[:, 1] * u"bohr^3"
        energies = data[:, 2] * u"Ry"
        @test _isapprox(
            BirchMurnaghan3rd(
                126.495155 * u"bohr^3",
                14.834320 * u"GPa",
                3.679199,
                -7.410112 * u"hartree",
            ),
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(
                    128.319495 * u"bohr^3",
                    15.070313 * u"GPa",
                    3.357205,
                    -7.410318 * u"hartree",
                )),
                volumes,
                energies,
            );
            atol = 1e-5,
        )
        @test _isapprox(
            BirchMurnaghan4th(
                127.670979 * u"bohr^3",
                15.327032 * u"GPa",
                3.463365,
                -0.218486 * u"1/GPa",
                -7.410326 * u"hartree",
            ),
            nonlinfit(
                EnergyEquation(BirchMurnaghan4th(
                    128.319495 * u"bohr^3",
                    15.070313 * u"GPa",
                    3.357205,
                    -0.178271 * u"1/GPa",
                    -7.410318 * u"hartree",
                )),
                volumes,
                energies,
            );
            atol = 1e-1,
        )
    end # testset
end # testset

@testset "Test `mgo-sety1.dat` from `Gibbs2`" begin
    data = CSV.read("data/mgo-sety1.dat", comment = "#")

    @testset "without unit" begin
        volumes = data[:, 1]  # unit: bohr^3
        energies = data[:, 2]  # unit: Rydberg
        @test _isapprox(
            nonlinfit(EnergyEquation(Murnaghan(110, 0.01, 4, -34)), volumes, energies),
            Murnaghan(
                124.88539638285143,
                0.012047999390789954,
                3.505337379827799,
                -34.34458025509868,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(BirchMurnaghan2nd(124, 0.012, -34)), volumes, energies),
            BirchMurnaghan2nd(124.60346122403192, 0.0119478059177848, -34.344520503316495);
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(BirchMurnaghan3rd(110, 0.01, 4, -34)), volumes, energies),
            BirchMurnaghan3rd(
                124.82366127014902,
                0.011559181270548115,
                4.115715176896173,
                -34.344311191717864,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan4th(124, 0.01, 4, -5300, -34)),
                volumes,
                energies,
            ),
            BirchMurnaghan4th(
                124.82134004287863,
                0.011506626229629386,
                4.171189921447817,
                -373.8291670908353,
                -34.34428288861632,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(Vinet(124, 0.01, 4, -34)), volumes, energies),
            Vinet(
                124.78343088049905,
                0.011244915521226076,
                4.5244363120324955,
                -34.344139097248,
            );
            atol = 1e-3,
        )
    end # testset

    @testset "with units" begin
        volumes = data[:, 1] .* u"angstrom^3"
        energies = data[:, 2] .* u"Ry"
        fitted_eos = nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(
                110 * u"angstrom^3",
                0.01 * u"Ry/angstrom^3",
                4,
                -34 * u"Ry",
            )),
            volumes,
            energies,
        )
        @test _isapprox(
            fitted_eos,
            BirchMurnaghan3rd(
                124.82366127026123 * u"angstrom^3",
                0.011559181270413301 * u"Ry/angstrom^3",
                4.1157151769280995,
                -34.34431119171783 * u"Ry",
            ),
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(
                    124 * u"angstrom^3",
                    20 * u"GPa",
                    4,
                    -17 * u"hartree",
                )),
                volumes,
                energies,
            ),
            BirchMurnaghan3rd(
                124.82366126764893 * u"angstrom^3",
                25.19753977636424 * u"GPa",
                4.115715175957134,
                -17.172155595859646 * u"hartree",
            ),
        )
    end
end

@testset "Test `test01a.dat` from `Gibbs2`" begin
    data = CSV.read("data/test01a.dat", comment = "#")

    @testset "without unit" begin
        volumes = data[:, 1]  # unit: bohr^3
        energies = data[:, 2]  # unit: Rydberg
        @test _isapprox(
            nonlinfit(EnergyEquation(Murnaghan(132, 0.01, 3.68, -14)), volumes, energies),
            Murnaghan(
                132.9174710492377,
                0.000997071972650323,
                2.6506133298092553,
                -14.821067528760938,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(BirchMurnaghan2nd(132, 0.01, -14)), volumes, energies),
            BirchMurnaghan2nd(130.7191505712864, 0.000706623449967504, -14.817402887854884);
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(BirchMurnaghan3rd(128, 0.03, 4, -14)), volumes, energies),
            BirchMurnaghan3rd(
                126.49515516259525,
                0.0010084167615290376,
                3.679199350825455,
                -14.820223865421232,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan4th(128, 0.03, 4, -320, -14)),
                volumes,
                energies,
            ),
            BirchMurnaghan4th(
                127.67097934611786,
                0.001041910691949355,
                3.463365305040609,
                -3214.0364009441837,
                -14.820651678910448,
            );
            atol = 1e-3,
        )
        @test _isapprox(
            nonlinfit(EnergyEquation(Vinet(128, 0.03, 4, -14)), volumes, energies),
            Vinet(
                124.71725873851614,
                0.001064866793589798,
                3.905491499988182,
                -14.820340399744088,
            );
            atol = 1e-3,
        )
    end # testset

    @testset "with units" begin
        volumes = data[:, 1] .* u"bohr^3"
        energies = data[:, 2] .* u"Ry"
        fitted_eos = nonlinfit(
            EnergyEquation(BirchMurnaghan3rd(
                128 * u"bohr^3",
                0.03 * u"Ry/bohr^3",
                4,
                -14 * u"Ry",
            )),
            volumes,
            energies,
        )
        @test _isapprox(
            fitted_eos,
            BirchMurnaghan3rd(
                126.49515516270048 * u"bohr^3",
                0.001008416761528213 * u"Ry/bohr^3",
                3.6791993508231235,
                -14.820223865421246 * u"Ry",
            ),
        )
        @test _isapprox(
            nonlinfit(
                EnergyEquation(BirchMurnaghan3rd(
                    128 * u"bohr^3",
                    44 * u"GPa",
                    4,
                    -14 * u"hartree",
                )),
                volumes,
                energies,
            ),
            BirchMurnaghan3rd(
                126.49515516262232 * u"bohr^3",
                14.834322684855008 * u"GPa",
                3.679199350823988,
                -7.410111932710624 * u"hartree",
            ),
        )
    end
end

end # module NonlinearFitting
