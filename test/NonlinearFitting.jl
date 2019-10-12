using Test

using Unitful, UnitfulAtomic

using EquationsOfState
using EquationsOfState.Collections
using EquationsOfState.NonlinearFitting

@testset "Test fitting energy with different element types" begin
    result = BirchMurnaghan3rd(
        0.0057009512119028044,
        103.58772269057364,
        -144.45152457521132,
        -40.31992619868024,
    ) |> Collections.fieldvalues
    @test isapprox(
        lsqfit(
            EnergyForm(),
            BirchMurnaghan3rd(1, 2, 3.0, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            EnergyForm(),
            BirchMurnaghan3rd(1, 2, 3, 0),
            [1, 2, 3, 4, 5.0],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            EnergyForm(),
            BirchMurnaghan3rd(1, 2, 3.0, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7.0],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            EnergyForm(),
            BirchMurnaghan3rd(1, 2, 3, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
end

@testset "Test fitting pressure with different element types" begin
    result = BirchMurnaghan3rd(
        1.1024687826597717,
        29.30861698140365,
        12.689089871112746,
        0.0,
    ) |> Collections.fieldvalues
    @test isapprox(
        lsqfit(
            PressureForm(),
            BirchMurnaghan3rd(1, 2, 3.0, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-6,
    )
    @test isapprox(
        lsqfit(
            PressureForm(),
            BirchMurnaghan3rd(1, 2, 3, 0),
            [1, 2, 3, 4, 5.0],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-6,
    )
    @test isapprox(
        lsqfit(
            PressureForm(),
            BirchMurnaghan3rd(1, 2, 3.0, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7.0],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-6,
    )
    @test isapprox(
        lsqfit(
            PressureForm(),
            BirchMurnaghan3rd(1, 2, 3, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-6,
    )
end

@testset "Test fitting bulk modulus with different element types" begin
    result = BirchMurnaghan3rd(
        7.218928431312577,
        5.007900469653902,
        4.06037725509478,
        0.0,
    ) |> Collections.fieldvalues
    @test isapprox(
        lsqfit(
            BulkModulusForm(),
            BirchMurnaghan3rd(1, 2, 3.0, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            BulkModulusForm(),
            BirchMurnaghan3rd(1, 2, 3, 0),
            [1, 2, 3, 4, 5.0],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            BulkModulusForm(),
            BirchMurnaghan3rd(1, 2, 3.0, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7.0],
        ) |> Collections.fieldvalues,
        result;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            BulkModulusForm(),
            BirchMurnaghan3rd(1, 2, 3, 0),
            [1, 2, 3, 4, 5],
            [5, 6, 9, 8, 7],
        ) |> Collections.fieldvalues,
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
    @test isapprox(
        lsqfit(EnergyForm(), BirchMurnaghan3rd(40, 0.5, 4, 0), volumes, energies) |> Collections.fieldvalues,
        BirchMurnaghan3rd(
            40.98926572528106,
            0.5369258245417454,
            4.178644235500821,
            -10.842803908240892,
        ) |> Collections.fieldvalues,
    )
    @test isapprox(
        lsqfit(EnergyForm(), Murnaghan(41, 0.5, 4, 0), volumes, energies) |> Collections.fieldvalues,
        Murnaghan(
            41.13757930387086,
            0.5144967693786603,
            3.9123862262572264,
            -10.836794514626673,
        ) |> Collections.fieldvalues,
    )
    @test isapprox(
        lsqfit(EnergyForm(), PoirierTarantola3rd(41, 0.5, 4, 0), volumes, energies) |> Collections.fieldvalues,
        PoirierTarantola3rd(
            40.86770643373908,
            0.5667729960804602,
            4.331688936974368,
            -10.851486685041658,
        ) |> Collections.fieldvalues,
    )
    @test isapprox(
        lsqfit(EnergyForm(), Vinet(41, 0.5, 4, 0), volumes, energies) |> Collections.fieldvalues,
        Vinet(
            40.916875663779784,
            0.5493839425156859,
            4.3051929654936885,
            -10.846160810560756,
        ) |> Collections.fieldvalues,
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

    fitted_eos = lsqfit(EnergyForm(), Vinet(23, 0.5, 4, -2), mp153_volumes, mp153_energies)
    @test isapprox(
        fitted_eos |> Collections.fieldvalues,
        Vinet(
            22.95764559358769,
            0.2257091141420788,
            4.060543387224629,
            -1.5944292606251582,
        ) |> Collections.fieldvalues,
    )
    @test isapprox(
        map(apply(EnergyForm(), fitted_eos), mp153_volumes),
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

    fitted_eos = lsqfit(EnergyForm(), Vinet(20, 0.5, 4, -5), mp149_volumes, mp149_energies)
    @test isapprox(
        fitted_eos |> Collections.fieldvalues,
        Vinet(
            20.446696754873944,
            0.5516638521306302,
            4.324373909783161,
            -5.424963389876503,
        ) |> Collections.fieldvalues,
    )
    @test isapprox(
        map(apply(EnergyForm(), fitted_eos), mp149_volumes),
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

    fitted_eos = lsqfit(EnergyForm(), Vinet(17, 0.5, 4, -7), mp72_volumes, mp72_energies)
    @test isapprox(
        fitted_eos |> Collections.fieldvalues,
        Vinet(
            17.13223026131245,
            0.7029766224730147,
            3.6388077563621812,
            -7.897414959124461,
        ) |> Collections.fieldvalues,
    )
    @test isapprox(
        map(apply(EnergyForm(), fitted_eos), mp72_volumes),
        mp72_known_energies_vinet;
        atol = 1e-5,
    )
end

@testset "`Test w2k-lda-na.dat` from `Gibbs2`" begin
    data = [
        159.9086 -323.4078898
        162.5738 -323.4089153
        165.2389 -323.4098546
        167.9041 -323.410722
        170.5692 -323.4115195
        173.2344 -323.4122481
        175.8995 -323.4129189
        178.5647 -323.413528
        181.2298 -323.4140871
        183.8949 -323.4145889
        186.5601 -323.4150471
        189.2252 -323.415459
        191.8904 -323.4158302
        194.5555 -323.4161579
        197.2207 -323.4164498
        199.8858 -323.4167071
        202.551 -323.4169305
        205.2161 -323.4171194
        207.8812 -323.4172809
        210.5464 -323.4174144
        213.2115 -323.4175216
        215.8767 -323.4176029
        218.5418 -323.417661
        221.207 -323.4176975
        223.8721 -323.41771
        226.5373 -323.4177051
        229.2024 -323.417682
        231.8675 -323.4176375
        234.5327 -323.417579
        237.1978 -323.4175048
        239.863 -323.4174142
        242.5281 -323.4173101
        245.1933 -323.4171922
        247.8584 -323.4170611
        250.5236 -323.4169184
        253.1887 -323.4167647
        255.8538 -323.4166002
        258.519 -323.4164244
        261.1841 -323.4162386
        263.8493 -323.4160446
        266.5144 -323.4158421
        269.1796 -323.4156312
        271.8447 -323.4154125
        274.5098 -323.4151861
        277.175 -323.4149528
        279.8401 -323.4147131
        282.5053 -323.414467
        285.1704 -323.414215
        287.8356 -323.4139583
        290.5007 -323.4136953
        293.1659 -323.4134285
        295.831 -323.4131559
        298.4961 -323.4128797
        301.1613 -323.4125984
        303.8264 -323.4123147
        306.4916 -323.4120269
        309.1567 -323.411736
        311.8219 -323.4114399
        314.487 -323.4111421
        317.1522 -323.4108418
        319.8173 -323.4105393
    ]
    volumes = data[:, 1]  # unit: bohr^3
    energies = data[:, 2]  # unit: Rydberg
    @test lsqfit(
        EnergyForm(),
        BirchMurnaghan3rd(224, 0.0006, 4, -323),
        volumes,
        energies,
    ) |> Collections.fieldvalues ≈ BirchMurnaghan3rd(
        224.444565,
        0.00062506191050572675,
        3.740369,
        -323.417714,
    ) |> Collections.fieldvalues
    @test isapprox(
        lsqfit(
            EnergyForm(),
            BirchMurnaghan4th(224, 0.0006, 4, -5460, -323),
            volumes,
            energies,
        ) |> Collections.fieldvalues,
        BirchMurnaghan4th(
            224.45756247137314,
            0.0006229382259822287,
            3.730991473426449,
            -5322.693307704408,
            -323.4177113158418,
        ) |> Collections.fieldvalues;
        rtol = 1e-3,
    )
    @test isapprox(
        lsqfit(EnergyForm(), Murnaghan(224, 0.006, 4, -323), volumes, energies) |> Collections.fieldvalues,
        Murnaghan(224.501825, 0.00060479524074699499, 3.723835, -323.417686) |> Collections.fieldvalues;
        atol = 1e-5,
    )
    @test isapprox(
        lsqfit(
            EnergyForm(),
            PoirierTarantola3rd(100, 0.0006, 3.7, -323),
            volumes,
            energies,
        ) |> Collections.fieldvalues,
        PoirierTarantola3rd(224.509208, 0.000635892264159838, 3.690448, -323.41773) |> Collections.fieldvalues;
        atol = 1e-5,
    )
    # @test lsqfit(EnergyForm(), PoirierTarantola4th(220, 0.0006, 3.7, -5500, -323), volumes, energies; lower = Float64[220, 0, 3, -6000, -400], upper = Float64[300, 0.01, 5, -5000, -300]) ≈ PoirierTarantola4th(224.430182, 0.0006232241765069493, 3.758360, -5493.859729817176, -323.417712)
end

@testset "`Test w2k-lda-na.dat` from `Gibbs2` with units" begin
    data = [
        159.9086 -323.4078898
        162.5738 -323.4089153
        165.2389 -323.4098546
        167.9041 -323.410722
        170.5692 -323.4115195
        173.2344 -323.4122481
        175.8995 -323.4129189
        178.5647 -323.413528
        181.2298 -323.4140871
        183.8949 -323.4145889
        186.5601 -323.4150471
        189.2252 -323.415459
        191.8904 -323.4158302
        194.5555 -323.4161579
        197.2207 -323.4164498
        199.8858 -323.4167071
        202.551 -323.4169305
        205.2161 -323.4171194
        207.8812 -323.4172809
        210.5464 -323.4174144
        213.2115 -323.4175216
        215.8767 -323.4176029
        218.5418 -323.417661
        221.207 -323.4176975
        223.8721 -323.41771
        226.5373 -323.4177051
        229.2024 -323.417682
        231.8675 -323.4176375
        234.5327 -323.417579
        237.1978 -323.4175048
        239.863 -323.4174142
        242.5281 -323.4173101
        245.1933 -323.4171922
        247.8584 -323.4170611
        250.5236 -323.4169184
        253.1887 -323.4167647
        255.8538 -323.4166002
        258.519 -323.4164244
        261.1841 -323.4162386
        263.8493 -323.4160446
        266.5144 -323.4158421
        269.1796 -323.4156312
        271.8447 -323.4154125
        274.5098 -323.4151861
        277.175 -323.4149528
        279.8401 -323.4147131
        282.5053 -323.414467
        285.1704 -323.414215
        287.8356 -323.4139583
        290.5007 -323.4136953
        293.1659 -323.4134285
        295.831 -323.4131559
        298.4961 -323.4128797
        301.1613 -323.4125984
        303.8264 -323.4123147
        306.4916 -323.4120269
        309.1567 -323.411736
        311.8219 -323.4114399
        314.487 -323.4111421
        317.1522 -323.4108418
        319.8173 -323.4105393
    ]
    volumes = data[:, 1] .* u"bohr^3"
    energies = data[:, 2] .* u"Ry"
    fitted_eos = lsqfit(
        EnergyForm(),
        BirchMurnaghan3rd(224 * u"bohr^3", 0.0006 * u"Ry/bohr^3", 4, -323 * u"Ry"),
        volumes,
        energies,
    )
    @test ustrip.(fitted_eos |> Collections.fieldvalues) ≈
    ustrip.(
        BirchMurnaghan3rd(
            224.444565 * u"bohr^3",
            0.00062506191050572675 * u"Ry/bohr^3",
            3.740369,
            -323.417714 * u"Ry",
        ) |> Collections.fieldvalues
    )
    @test ustrip.(
        lsqfit(EnergyForm(), BirchMurnaghan3rd(224u"bohr^3", 10u"GPa", 3.75, -161u"hartree"), volumes, energies) |> Collections.fieldvalues
    ) ≈
    ustrip.(
        BirchMurnaghan3rd(224.4445656763778u"bohr^3", 9.194980249913018u"GPa", 3.7403684211716297, -161.70885710742223u"hartree") |> Collections.fieldvalues
    )
end