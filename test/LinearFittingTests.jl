"""
# module LinearFittingTests



# Examples

```jldoctest
julia>
```
"""
module LinearFittingTests

using Test

using EquationsOfState.FiniteStrains

@testset "Test data from Pymatgen" begin
    volumes = [
        25.987454833, 26.9045702104, 27.8430241908,
        28.8029649591, 29.7848370694, 30.7887887064,
        31.814968055, 32.8638196693, 33.9353435494,
        35.0299842495, 36.1477417695, 37.2892088485,
        38.4543854865, 39.6437162376, 40.857201102,
        42.095136449, 43.3579668329, 44.6456922537,
        45.9587572656, 47.2973100535, 48.6614988019,
        50.0517680652, 51.4682660281, 52.9112890601,
        54.3808371612, 55.8775030703, 57.4014349722,
        58.9526328669
    ]
    v0 = 40.98926572870838
    @test get_strain.(EulerianStrain, v0, volumes) ≈ [
        0.17749734613767998,
        0.16201229839015363,
        0.14705196468522874,
        0.13259433633439055,
        0.11861428460608225,
        0.10509239492761757,
        0.09201008130906252,
        0.07934607736917354,
        0.06708557020358508,
        0.0552093893237503,
        0.043704151717372075,
        0.032551138219835574,
        0.021738453213956288,
        0.011250631487461304,
        0.0010768691828133559,
       -0.00879571243518995,
       -0.01838039465214164,
       -0.02768646727024454,
       -0.03672601609939291,
       -0.04550846145018128,
       -0.05404287277132974,
       -0.06233970600633609,
       -0.07040712280723271,
       -0.07825377702272912,
       -0.08588638996615916,
       -0.09331442415000685,
       -0.10054463011940301,
       -0.1075828678792159
    ]
    @test get_strain.(LagrangianStrain, v0, volumes) ≈ [
       -0.13099486451833953,
       -0.12236351105872695,
       -0.11363226812607319,
       -0.10480202613156259,
       -0.09587095509895383,
       -0.08683995684674645,
       -0.07770989398154193,
       -0.06847899767396914,
       -0.059149424468252,
       -0.04971943052962041,
       -0.04019111457888069,
       -0.030561514081675456,
       -0.020832711371037982,
       -0.011003048988641961,
       -0.0010745548727579268,
        0.008953212194864557,
        0.0190818588446644,
        0.029309415622954416,
        0.039637468728734304,
        0.050065246093897176,
        0.06059200478213067,
        0.0712192845248587,
        0.08194633401200402,
        0.09277353626347284,
        0.10369906697722475,
        0.11472551485871496,
        0.125852144820906,
        0.13707718021610538
    ]
    @test get_strain.(NaturalStrain, v0, volumes) ≈ [
       -0.15189876859201823,
       -0.14033801748544264,
       -0.1289092546069999,
       -0.1176106297063706,
       -0.10643692669611844,
       -0.09538653341846574,
       -0.08445778277754971,
       -0.07364595812672871,
       -0.06295105569265277,
       -0.05236861111679098,
       -0.04189858087249365,
       -0.03153541438302606,
       -0.02127915820568489,
       -0.011125922058677679,
       -0.0010757111979426712,
        0.008873996435816848,
        0.018726748238692272,
        0.028482534552264627,
        0.0381447307354657,
        0.04771440101503085,
        0.05719263915631435,
        0.06658253672817539,
        0.07588506772815591,
        0.0851021663162455,
        0.09423387093583208,
        0.10328387622610548,
        0.11225302719931324,
        0.1211413559225737
    ]
    @test get_strain.(InfinitesimalStrain, v0, volumes) ≈ [
       -0.1640423928171002,
       -0.1506626772344306,
       -0.13758688871244362,
       -0.12480606002491879,
       -0.1123077673073063,
       -0.10008399218206754,
       -0.0881269055666829,
       -0.07642563827621052,
       -0.06497471350599215,
       -0.05376410009427657,
       -0.04278871466598844,
       -0.0320379239348092,
       -0.021507173948334346,
       -0.011188045308548222,
       -0.0010762899827498895,
        0.00883473873948748,
        0.01855249213433896,
        0.02808073099690478,
        0.03742638317829727,
        0.046593960004638224,
        0.05558787891231487,
        0.06441430751249311,
        0.07307726622682587,
        0.08158155182153393,
        0.08993010154841308,
        0.09812908257335062,
        0.10618193139700183,
        0.11409127770318894
    ]
end

end
