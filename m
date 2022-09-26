Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A265E9C3B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 10:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbiIZImN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 04:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbiIZImM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 04:42:12 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A482612C;
        Mon, 26 Sep 2022 01:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664181731; x=1695717731;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eMsuOwMppO6t22ABdZr64RtR/zPgZqxZU8keSBKKavA=;
  b=JvYNQJbgMhmXQIRSTOq29D5G9bjxAGYFwMMdMDKNo1HKal9FYbAAPGHh
   yFHTCD1dtaVs//1UwcUBvyIXErVYWhpn2MjUEVOguNeuiXnoijhc9QjbZ
   Qu3IizVjR+O+wSF2J87XZbRzDytS73FB3ZiYNZt1mRjhXWkE+Bbifo7il
   4PIvFnYL9ILNRoKRSYttKVdw9tDO5ga4DEWG/F67ekwyhJA6/joXjGqfH
   lQ3s4SJIkxtZrhJ3F1wAIlqoRor6Y6YloCpe0deeZC4wuB/aeC9W1VcZk
   d3KNx38sos8SU5a/17oYKZL1ixsetqDHQJIWQ6qArqC+OuvZ6H0hctkIG
   w==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="175555915"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Sep 2022 01:42:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 01:42:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 26 Sep 2022 01:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atk8rlvtAzfG3v6v9IW2E4EHsBqpKhfsuM4c0O51yejaUMiYGFKBLOjQ0fC+MiIBK99MOMOSVUgBOUwT8ZoXsqnymYzep864dxddfGY95Ki/vYSWs48aaXdf5tyV+HT+ZFWxuOfyUdBofqFaVk4l/vnHBtI9sfdnZEvr31IvHKQoF6CoRwAbYcULrUhNHm/UPQcM9uAgYXdPUAsutunyhtzpZ5dzVnox6va1JoZJHtG/VTXrS2AbDtDlDeVbMQxkhHwlyQt9E4GATwB9vB9vkfi1bzOmEZqupB1mUuJfhrm1YWwvgQU13aV2fvCOFgO2L5OpsDsveUrR1ldz4psr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMsuOwMppO6t22ABdZr64RtR/zPgZqxZU8keSBKKavA=;
 b=UZjaMWoVHvgBYZpvMu9/WfiC21XFRrvfYKbLza0WwJQh6E8fd7CDXBhU2lV/nV9k039bHM09dZMknZmVSafu0TQkPtncumxANYAIjlEonLI/RmveU2KXY4KIG49ZvLFBX802D24vLfqNcK1DZCoSW6Bo78JZmCuQCnI3hZ4oiv6XLBa/yiwgzIMiYKpuPe5JnQoGmldmwIiCzlmeUpnkSiGRrUNWCEs5a46XCykQ8n3PxccTQQlsA98U+YHHIVGbmU9EblS/XjjQoNmoU4BX6S0lE5wu4TSgsQzmtYAm1RQ2yCbeBTDStdR5SRykp6Im/tXdfPZ9iuCQtnXfq3z3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMsuOwMppO6t22ABdZr64RtR/zPgZqxZU8keSBKKavA=;
 b=FQWzr/kQevC+DqM2CoMX6B01K4KmuhYOhWTaEnOyT392M+DdMvd6AIUWKoNpyAE7q6CRuSK9kq0IEQRO2+T3FbnbhlLrgRR4Hb5dq87/uaMne8NalgrpEG3DyK99fO8C6mEUyEP2yQqdcDJHzefrKmEjeEIbdwbvBdNe6p+XqH4=
Received: from PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:42:07 +0000
Received: from PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::3c5c:7050:7ea3:6ac]) by PH0PR11MB5096.namprd11.prod.outlook.com
 ([fe80::3c5c:7050:7ea3:6ac%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 08:42:07 +0000
From:   <Tharunkumar.Pasumarthi@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wsa@kernel.org>
CC:     <krzk@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <sven@svenpeter.dev>, <jsd@semihalf.com>,
        <semen.protsenko@linaro.org>, <rafal@milecki.pl>,
        <UNGLinuxDriver@microchip.com>, <olof@lixom.net>, <arnd@arndb.de>
Subject: Re: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Load I2C driver
 for I2C endpoint of pci1xxxx switch
Thread-Topic: [PATCH RFC i2c-master] i2c: microchip: pci1xxxx: Load I2C driver
 for I2C endpoint of pci1xxxx switch
Thread-Index: AQHY0YG97H7zYf3Z90CqJz+W0vX2fq3xZSgA
Date:   Mon, 26 Sep 2022 08:42:07 +0000
Message-ID: <f06a5f0e54bbe41208c1aaec275c2c9a2245c1c0.camel@microchip.com>
References: <20220926082642.2578447-1-tharunkumar.pasumarthi@microchip.com>
In-Reply-To: <20220926082642.2578447-1-tharunkumar.pasumarthi@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5096:EE_|BL1PR11MB5318:EE_
x-ms-office365-filtering-correlation-id: 2c6bf035-e981-4a10-f92e-08da9f9afeb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8KmoyZvE6H5GtdUx+p5PeAqU/zhhpA1sYWS2Tl9dK2yNxOCWPP4uJE2V1jWLzf657bDGxkMcNY6FDiIiOi4GCLtn/8/X1oOzD+j+O6k1VSFsKSI20qPU9ht/GMjPrzoZMZBsCiSPX05Ait8MSB9JY+xNKbLhDuC0Vf5+Kb3rUSbPmWOnBL/CHoBjHA5to7L/7I7K4sHn6vCRrBPlqrII6aijI34kUGXJj1B+4EAl7ZTNV7YkjnxsO7gmHB8Y2uBK6FUzXu9e69ENq0TkhCEXr5+EvjWyYURXmTQGbeDpRyIQILDlAqukWtjyLlnFOKahOCLmtAoR6vAlL+zQ3d+9QEb3/FPMdNhsItfrmNVHONJ5YL8gFOOtxF9aKzZiKl8Ca15hVvjSR+57QMXyV55IijweCFVppSgdB54bKohmW+BFTZKUbr2my7Rh8VD+rT0cp+Uy12Moy3WrmB3XdzCucH8BxbqGceDiEJOaaLeEXqWjMOW3rgKAl5fnnm0v6G3++YTaaFe4j0LSdM5JSpAFT2MZtfDXZKIAK2YwgUUWWV581BBpon0BwlB2NTnmVQCtAfYL0tNDOMtGkLHgtF9sPahON0Ljb1Bo9VexAovXs3ZtoSIe9u7Lp8m9Kp3C+5dDDP41kaCCxmxs5K7xKfZ9B8FZRoIQTO9bJeebP7UJwAi1xeOtqGkxHXpW/+suNuru8WSQsiNLA30hEHYiKrt6nDL/fqO86KCezOCrYvpY4uFU2L6fcOtRzSq6Mdch2mZhxpPSwC4yWhHUPityQjsq2GQChvjYOKdSOp3I8ozlznFq+CbvClltY7GrDPotN2M3Dsm06GZFyxOoPJOqRbKsmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5096.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(36756003)(558084003)(71200400001)(41300700001)(6512007)(26005)(186003)(38070700005)(8936002)(86362001)(5660300002)(7416002)(2906002)(54906003)(110136005)(122000001)(64756008)(66476007)(38100700002)(66556008)(8676002)(66446008)(316002)(2616005)(6506007)(478600001)(6486002)(76116006)(66946007)(91956017)(4326008)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDRJbUxvZU1GU2FpTUhtODg1S201MXVhb2UzeEZqY3pMV2lOOVMxbDJXeklq?=
 =?utf-8?B?cW1lek96eE5sQjArdmpFU0c1QlJIa1lxbjFMNlYzRWovVmFpVjhPS3pZNDQ5?=
 =?utf-8?B?Ym4reW1lQ2R4NTRKc2crNmc0S2s1aHhtOWFkWVhCMUhnQld1dVhTdExrVWdG?=
 =?utf-8?B?S1hqMEI3Sk1HdlBndFJLaEppcyswMnlpVjMvQVVhUE1MeUZVcW9jeDJ3VGFj?=
 =?utf-8?B?a04zcUtRZmJkWjVpaUJZM2hOcTVzUnFQMDVjZ2dXNnYvTWQ3UTQ4MU9Rajly?=
 =?utf-8?B?bnliNVBHRlNDaHBjWnQ1b0I4dmdUWXl5OXZvZFhQQjMvekE2NDdhQWxHSFd1?=
 =?utf-8?B?YnU3dUZqamZHVm1VcEdKOXE5REhSMkJpcjZROTNDcng0SlpTTFMzeWRjRkN1?=
 =?utf-8?B?ZFJqaC82UVFpZnlvcXloZkJHNFR1dXBmTGtyenNpM01MWlRFSjJaUWhxVThk?=
 =?utf-8?B?N0hMMEI3QnZXUWhDRlc3UHplaHFYREVrYUFXQ01IWTkzWGpLVS9RWndDYVlG?=
 =?utf-8?B?d0x1dXM4cjN1VEVObzd4K3hyR1dCUkFRWVpZa2dGd2FLbXZIRkJWdlVWOWdY?=
 =?utf-8?B?Q1hON0pUMGdYbmFCK2RJRk01WEtGc29LdUlXNEdQdzR1M2Z2c2d4cHZWVGNF?=
 =?utf-8?B?UUc5aUhnL1hIZFRac281WEo0V0tqNHBDUlNnT0EvTVVITzIwZkZmekExVXI1?=
 =?utf-8?B?b0RySWFnRk5XZmh6Qll2dE9lL0Z5MFNZbVZ4SVlpazNmRjI4Z05LYnozbFls?=
 =?utf-8?B?eDVTenBlZ1MrRmJ0dmF4TzZRS0RHME9vb2NldHNaK2NWKytreE1IeStnSG9i?=
 =?utf-8?B?M2pYOGtMcWgwSkpxQ2pYeTFGcWlYUUtWMGQ2aFJFMVB5N1EzLzgxMFcxWEhr?=
 =?utf-8?B?S1JSSU5RVHZjTVl6OFVLS20wY1JlVHRSM0l2Q1RUOEw5L3JGSzJMenkrQlJ3?=
 =?utf-8?B?QlJwSzc3dllCQVV5RU1HbnI4RXhmLzlWNUwvL1J0S21TTmFTN1c3QkNHdmJr?=
 =?utf-8?B?RlV6Vm4yU2w2b1VSdzZQUGZ3bUJ1d0p6L3psNHdIa0lMSjh6QTJDcDdJN1FO?=
 =?utf-8?B?ODZoV2hQcFpQM2wxWjdhNkx0bUFaYTQ1c1pxNHlTcldtYTJtWmkwSGRPTnBt?=
 =?utf-8?B?NjNoV3dEdUtadmRNY2VWYks4R0VVSUNSMVBxUFRMMGlSajlYV0ZwUWU1aUFE?=
 =?utf-8?B?K2FLMm9YQ1hrT0wrN0ptUHgvZTFiQ1VtcTZLUllmdjZrNGM5OXowVGp2czIz?=
 =?utf-8?B?Z1RDMXo1NmxlNlhtQkw5OHBDY3dkTFZGUXpYVDd6OXFydXJyK09zeHRlb0xG?=
 =?utf-8?B?ZFcrQXZ2NHFTMlhRcHB0TGtkWFI3ek1zUGZ3NzN2aXJDcU9QL1Z0TlZrcnV0?=
 =?utf-8?B?bTcxNWhoVHloZTdjdTdCSy9zZUErNWZoQWpzTFZNR3NGUjk4VDFmNGxFeFdZ?=
 =?utf-8?B?NURHYVh5NTZsSjdmZ2k1RXBOQnhnSkJndGs5T1htcUJGQmRCaGNIK2RnamJ5?=
 =?utf-8?B?ajNEK2czZUhSeVVIUGpNZjZ6Y1p0NjZzNXRuaFp4WENaVGFUZ0YrK3F2Wndl?=
 =?utf-8?B?WlJ3NFFvdG1oRWdFWWNzWCtkdzhEYzZIM2FZaDl6NEJacnQ4RzcrNzNuOC9t?=
 =?utf-8?B?Y3hCcW50MUZqeGIrS2FlY1pPTDVVK21FaGNVOUptYlRWdUxyU2E5ZndhSXMw?=
 =?utf-8?B?V3BhVXFtRjhCT2xuazFLblZpTUxQSm1LcE4vSUU1dVFhTTdhcXZqUnVqR2VU?=
 =?utf-8?B?aHlrTFFTYlYyZkFMVnZDcDh0b2VwZjE4a2Z1VlM3UitiYjdpWHJReitZdit3?=
 =?utf-8?B?aC9tMmpXMWhGamJ5Uno4Qm1CYXd1QXhlbzlidXNyS3FINndwbDhDV2JsL3k2?=
 =?utf-8?B?UXVBb1N6bllCdVlZZiticFVUWnZOOVFrR0oySk5CeWhHYU9YY3JEL080dnFE?=
 =?utf-8?B?M1B5SElaOGhnL0FEYVlKWldwVGhkQXlaNVFKb3d1MkRkSTZPUWNPVllpSnEz?=
 =?utf-8?B?MlJnRW1XMWdUa01TL1kxTG0vQ3JsenpGRGdFZ0lxdVNyeHRObytHbVk4eU5p?=
 =?utf-8?B?UHVzaUEyRHJRN2Fxd1dxTVVZQ2RqNFBmVE1PbmVZbUoyUnlPSzk5c0ZBWVY3?=
 =?utf-8?B?Rzk0NEMvcndPUUFoZmV6bjlsdVFWOUhFRVUrUHdsMURUOHFRNDh4K0ZSV2x0?=
 =?utf-8?Q?OETnW+241rf6yW3VmJO1Ow3/SA9UZk82M+JWt7GGJll+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CFD417B2AAA3D4CA231109655A487B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6bf035-e981-4a10-f92e-08da9f9afeb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 08:42:07.3022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vWg1SvDUn5BsyLiJpr2X4XslqBVCJH/djimZAJsSTgYOjIxu2i/RxjsjdF4h4yRAeoRyjgWc76AYNsdvfgpzpPcMaXbpEdkOSM/zW5V9ZQxOyOaJQr2D29rD50LfFUZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIyLTA5LTI2IGF0IDEzOjU2ICswNTMwLCBUaGFydW4gS3VtYXIgUCB3cm90ZToN
Cj4gK01PRFVMRV9BVVRIT1IoIkt1bWFyYXZlbCBUaGlhZ2FyYWphbiA8a3VtYXJhdmVsLnRoaWFn
YXJhamFuQG1pY3JvY2hpcC5jb20+Iik7DQo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIk1pY3JvY2hp
cCBUZWNobm9sb2d5IEluYy4gcGNpMXh4eHggSTJDIGJ1cyBkcml2ZXIiKTsNCg0KSGkgQWxsLA0K
DQpLaW5kbHkgaWdub3JlIHRoaXMgcGF0Y2guIFRoaXMgaXMgdGhlIG9sZGVyIHZlcnNpb24gb2Yg
dGhlIGVtYWlsIHdoaWNoIHdhcw0KcmVzZW50IGJ5IG1pc3Rha2UuDQoNClRoYW5rcywNClRoYXJ1
biBLdW1hciBQDQo=
