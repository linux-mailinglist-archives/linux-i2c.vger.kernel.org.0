Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6399A631D2C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiKUJqo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiKUJq2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:46:28 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C8A97A84;
        Mon, 21 Nov 2022 01:46:27 -0800 (PST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL957sR026838;
        Mon, 21 Nov 2022 04:46:12 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3kxvx9t6p9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 04:46:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMY9hsokaYfHC8DxBbu7xd9F4EHHSE3err/PoJG6/lR/WxKELJui8lhQeD/FlZBuKfM4pvzVgioVuBUNRel0ENnK1SrychAgVGct6/RT6dDsfIyZVAWS0LC3iKQiwkNKytpWq0kwpnMAtaZRe7Hd97+Jnf/9iWiqPsRoG/5zl0r9/DBjk6xhPkaqrYLy8Cdj9otV/ELaoDkDoCYnv3sxrgvI9JalkT7Kg/SOAFTOrqGow4TTqKjVfyYx0DadjLpLE3VzkJUpFLJ/z7p/tYROSbcLITQLxhW7XiHdXedKKScIZSh5+05N3g0WJWhfsbzhIKeaCN2oZ9VkAkfvvM1/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJTsnXojaKKfmsKoMornpzEmgeptuEV70hjhJOHk0cE=;
 b=Be8gZq5IKKFLvNyUy261rh8z0bd7w2EOC/K0MsjlYgB3WU08DXLMmTHCS5oIttrd1SpfixyU0ZqJhN4eU2oXkZwCSZdJbKcL2oeZxlJmW7PSWvRrvmdGCqbqc70nXvh3k7rhqEAJ8I+DmdVJ/90WmPVgDI1mible/kBvv7auTgKRbv2eENaW6istItlcH/7kbwRNh0jzE5j0LZ8JBvu0/iJBFEsmGDJOdm2gkrLKlTrMYpAtLLWerLi91T+5vIdfQMFDArdrzNwEwcL1XkuPpdQMx/0sf/o2+jM6MAmPiMY3GvweaEvhw0G0Y4MNMgz41AaGeVfQFfHfmy03kcRmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJTsnXojaKKfmsKoMornpzEmgeptuEV70hjhJOHk0cE=;
 b=h9Q/hjIWSi/Z8jdsNqCAPwyNuxYzdEJ6+Z71eNuy2GTPqSnVxHy0LsQZB5scYuamG1RlUJmhdv7neZIQVv5fEutdJYxvFXAcm3feGbMKkGnNuVfAzd4OErUhRz/zo5CX5aQhoZ5i3oXZvwSjtNtoWuxml6TX3qJClz2J3ogCOSI=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 09:46:10 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:46:10 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 539/606] regulator: ad5398: Convert to i2c's .probe_new()
Thread-Topic: [PATCH 539/606] regulator: ad5398: Convert to i2c's .probe_new()
Thread-Index: AQHY+5/c7HPynrRZj0qmtKWbjYGRza5JJNnw
Date:   Mon, 21 Nov 2022 09:46:10 +0000
Message-ID: <SJ0PR03MB62536F144270F8B01D3F0BDB8E0A9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-540-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-540-uwe@kleine-koenig.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAxTW1GaFpHRTBNeTAyT1RneExURXhaV1F0WWpjeE1pMWlZMll4?=
 =?utf-8?B?TnpGak5EYzJNVGxjWVcxbExYUmxjM1JjTlRKaFlXUmhORFV0TmprNE1TMHhN?=
 =?utf-8?B?V1ZrTFdJM01USXRZbU5tTVRjeFl6UTNOakU1WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXlNVEExSWlCMFBTSXhNek14TXpRNU56VTJPRGN4TlRVeU1qQWlJR2c5SW1w?=
 =?utf-8?B?SFkwRTJkMnhsYjJGbU1sUk1jWEZOYkZCMk5sSkVNVWczT0QwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUVZWWVowMVdhbll6V1VGVGJ5ODFjbXAwTjJ0U2Jr?=
 =?utf-8?B?dHFMMjExVHpOMVVrZGpSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQldEVnNNa3QzUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|SJ0PR03MB5870:EE_
x-ms-office365-filtering-correlation-id: dd548064-e9c8-4d37-73c7-08dacba53880
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jKcj7Z7+Ttpuow6qyem7UGNtjv9bNhOGhzFLFxk+Zu/vP2IUrfGmN5qBZhXtKA2cx0q+WS4377W7JiZ0CsTUoGuRGCgkZCnGX6mE+3uQ3DODs8IVGhZ6pG1wPur18gqrpastsomjt8kxuiyAvnbKvf1zcnIyxQ+ZxY4VNfhIRvfR+cbiVx7fy5RRBDhVeBvsr7NTm926/Qae0cTjphg9FLI6k1YxhUPKEo38HTtWT3LKugGKDpe8dJGy582iRZI7DcYe1kC/VTA2lkxmv6OwZMQjWyYzuhQXRFldI2kUoTdP4w9bChn4gQAem6FChKX6AoKf9bqBWqbd3tWRXYFkiId3nnI0gx80Rl91RPGFDftmVSwOFqW+inFi+NUWq8E+A5+nIpeNra++Dt/FkeMjH/r2pp+Oy9M8lQTwHHcvD8JEZhHW58GtZd/SCoCPPh3+WK3QuTy9MAnDLKoHRywXeKPEHdxKyKHUw96WHVBhB/Ie0MyyKmaoE+aB7qJtAo0bUI4CfdyWnzIX6ZL0P9xNVmZNp/oyFTzjBIhrfD4gEYXUhKb8CpehTf8+7TRZmlBKrjGKjXWeTCo5SvEhp0G6RmE9bmlx2K+DR6Pq5w7UWr60Sb5FXGykRIcpWG/qtj0+WrHeowVP6hIY9Cy6X1gtqnJlRbX2Q5ryMuT8A2RG7izUFkE7tLaOGgBMZxUCS5H1bR3MLkNNRcCqYCLXXvbvPIFjPE3/o+myrn5zqgPtccs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(6506007)(186003)(7696005)(9686003)(53546011)(110136005)(2906002)(478600001)(71200400001)(122000001)(38100700002)(38070700005)(55016003)(83380400001)(33656002)(86362001)(26005)(7416002)(8936002)(41300700001)(66946007)(76116006)(64756008)(66556008)(66446008)(8676002)(66476007)(52536014)(4326008)(5660300002)(316002)(54906003)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEJSdGp3Zk9BRnBHZGF6VEhhY0RwZ2VjTzNYcnlmTWtZZmFsZU5nK29XRHRw?=
 =?utf-8?B?K3NhemgxOTdnQ3YrT3dFZ0hiTXlyQVI3eCtPbkhCOGVVeHRoQjFMOGxHT09a?=
 =?utf-8?B?ZWFOcktMSmhZbFlBR09WbyswMUdaWFZLamt1SkpWZGRaQytqRCtaUGRLa0Y5?=
 =?utf-8?B?TFhTTS82UDJtNENTVWdVSmpvTzZhQ3lUZm5Kbkp2WUlrY21oMml6V05pYk9G?=
 =?utf-8?B?bXBlT1VsMDZnNStoTXZMdjZtVGphQmhBNFo0TUdkdm5oTGZBOFhyMEloVS9k?=
 =?utf-8?B?N0xLZFlxbFRhUkZESXBMKytoc3hGNXNhU0s1SmI2QnhhcXN1MUNRdng3a1VI?=
 =?utf-8?B?Z3p5Q21WQy9NWnhPb2l3TmFqMXhocU9OZXZpbDRTVUlIN2oyakNNVkdmV2Jj?=
 =?utf-8?B?M2lSb1pYUFJIeWgydUc2eHk5b0t3RTlMbDVkeFdiSTI2RVFiQUxOSUxtcW9x?=
 =?utf-8?B?ZXViU3RlVWxxc1FzUGlScG8yRzNzdWVSREFidDZlUUx3SVBpR1pmczZ1R0tm?=
 =?utf-8?B?dkQ0VldsR1lmZ0pLSTFNTWJ6dXdqR0JFZ1V2N25PeXpidDdrSDNOT3VsaE5C?=
 =?utf-8?B?Y3pGQmgxbFl2cTlmYmZqaTMvWHVVNndYWFA2ZTQ2eERGekVyNGJoeXBLaE9o?=
 =?utf-8?B?WTN1VWxXWXFVMWkrU3pVdDlsSmtIbTVLZEFWUndQN0xRTzBPM1dKZDduYzc0?=
 =?utf-8?B?UTgwS2dsUWZKdXZ2UlZWWHlCSWlOTUI2WGxSZ3dkYjlmSEpQcVIxUU1Cb3Vx?=
 =?utf-8?B?bVhhN3Z2eVFYQlNnNkM5R05YZEs2UGxEbzJaVHB3VmtnREN5aDZwaHVRTXow?=
 =?utf-8?B?Q1ZUVVVwaW9oRG1GNHl4b3laVTI4ci9zNFBDVndySUtJQjdpVHFSdkpBL3Zu?=
 =?utf-8?B?MXJaOTR2ejdoWVpTR29ydGxJd0NYb3o5eVNiOFFFemFiT1lHa2dnWFpYNTBS?=
 =?utf-8?B?VmoyK1lUUmU3Ly9rTE5ONzFVZWFMK05aS1JNSTh4S042TnpEdk50Q2xsaVJE?=
 =?utf-8?B?K2VnenJRUmhMWFZKUmxva0FkUE5jRjF6S0paa2MrRmoxSmxwV3FrNVg5N2N3?=
 =?utf-8?B?ajFkanBNc1RiVHFuemtuN0ZKejZjTTVVV016YUZoQkJNSGxMK3A1aVl6emkw?=
 =?utf-8?B?T3BYL0x0WVBjdURxbHBJMkZQN21yMVFXNWlrWmNtQ1drelltaTloK1VzWnV3?=
 =?utf-8?B?T0p2aisyak5UTUN2M1EwTG9QdUU5YkRmK1NFVllIWi8yRzdmaitPVkpUZStx?=
 =?utf-8?B?LzRUazdvT0UzNTlabUpaYXBpcVBQTlU5bkZPNklJYlBjazNrRHpXMmNpM01G?=
 =?utf-8?B?SWh1T2JKY3Fxd2pMQUN1S0l4YjNWYUVIK2FLenM5KzdLZkk2ZFFUMmxRT1Yv?=
 =?utf-8?B?Y1RuV2tzUS85d0wvRUhzaERnZEpQYzFkcUhZeU5HUzk3Z2UxL0hFM2w3a1Qz?=
 =?utf-8?B?VkUvZ1puY2tSNktycnBXQVd4K0VFNEZGZ0xWU3FVV1gzZkJ3ZmdhWStCNHdJ?=
 =?utf-8?B?ak5XT1I3UCtuMUZSV0JUM2pwVnJqOXRHeFZ1R1hCV3BhbTJTZWE5VC94RjZB?=
 =?utf-8?B?QTRTbTNCaUlvdTI5cSt2OGZ2YkY5YWgydy9ORlZmOWZnRFRSejhGRGNDd2sx?=
 =?utf-8?B?dzJOckk4eWtOVERwcE9LMjhxaTNrQ0xCMzRWVTlRQWZPQm5ydHc3TjNGZU5V?=
 =?utf-8?B?aStLSkp5OHlMcElYd21OMis0aEF2ZmJsWjJxQ2RnTUc5RnVGMzFvRUJiQ3Jk?=
 =?utf-8?B?WFJnN281aUU2QU4wdEI1YTdYWHk1Z01xZmtQeW52YnUzVFlZdEE4R1JJbzho?=
 =?utf-8?B?d2ViU0xsV1RnTjlzSHdZV0duU0h2NldEVDVmb3VuSlliVzJRNmxvdnpOOHBG?=
 =?utf-8?B?bmlGWDJDdjNQRjdrcEV2bGFOQjlRdTZKQk11RVA2dEV4QUlzY044RUplNTVW?=
 =?utf-8?B?R1dVQ3lGTmFlMytyc2ZDamhJSC85YVl1OW9FQ3crYUVSZnh4dXY0Y0lDYTdJ?=
 =?utf-8?B?WisxRXpDTytKSkJmQ2ZxQTVzTnp3aGZlaU56d1RrVlBYLzhzbTBjcWNVVlhF?=
 =?utf-8?B?b21wWUNFU1BybklPcUZreEMwaVdWdTRwOHBXaGlOYWZ6WDVYYjV0UUtUOVNF?=
 =?utf-8?B?WUgrUGdtVS9KOTRSRThNSFpVWmlqbG52T04xc0N5MnNxUzBKRnRzZzFWTnpk?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd548064-e9c8-4d37-73c7-08dacba53880
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:46:10.4018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ifeO0B7Sg6bPb1YTAq941m1qMj5vj7s3ow1zZgn9SN8f7eMDCnv3EvwfZlWyoHYWqUwPWBY8ChM+8+XLue0VvQVCc68m5ak4BozNWP1PpW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-Proofpoint-GUID: AaV91E3--JsBU5O7p3IThwBp8K2Xksx0
X-Proofpoint-ORIG-GUID: AaV91E3--JsBU5O7p3IThwBp8K2Xksx0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211210076
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4NCj4gU2VudDogRnJlaXRhZywgMTguIE5vdmVtYmVy
IDIwMjIgMjM6NDUNCj4gVG86IEFuZ2VsIElnbGVzaWFzIDxhbmcuaWdsZXNpYXNnQGdtYWlsLmNv
bT47IExlZSBKb25lcw0KPiA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBHcmFudCBMaWtlbHkgPGdy
YW50Lmxpa2VseUBsaW5hcm8ub3JnPjsgV29sZnJhbQ0KPiBTYW5nIDx3c2FAa2VybmVsLm9yZz47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IExp
YW0gR2lyZHdvb2QNCj4gPGxnaXJkd29vZEBnbWFpbC5jb20+OyBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IENjOiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBrZXJuZWxAcGVu
Z3V0cm9uaXguZGU7IFV3ZSBLbGVpbmUtS8O2bmlnDQo+IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtQQVRD
SCA1MzkvNjA2XSByZWd1bGF0b3I6IGFkNTM5ODogQ29udmVydCB0byBpMmMncyAucHJvYmVfbmV3
KCkNCj4gDQo+IA0KPiBGcm9tOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPg0KPiANCj4gLnByb2JlX25ldygpIGRvZXNuJ3QgZ2V0IHRoZSBpMmNfZGV2
aWNlX2lkICogcGFyYW1ldGVyLCBzbyBkZXRlcm1pbmUgdGhhdA0KPiBleHBsaWNpdGx5IGluIHRo
ZSBwcm9iZSBmdW5jdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNCkFja2VkLWJ5OiBNaWNoYWVsIEhl
bm5lcmljaCA8bWljaGFlbC5oZW5uZXJpY2hAYW5hbG9nLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZl
cnMvcmVndWxhdG9yL2FkNTM5OC5jIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9y
ZWd1bGF0b3IvYWQ1Mzk4LmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9hZDUzOTguYyBpbmRleA0KPiA3
NWY0MzJmNjFlOTEuLjJiYThhYzE3NzNkMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9yZWd1bGF0
b3IvYWQ1Mzk4LmMNCj4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3IvYWQ1Mzk4LmMNCj4gQEAgLTIx
Miw5ICsyMTIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgYWQ1Mzk4X2lk
W10gPSB7ICB9Ow0KPiBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgYWQ1Mzk4X2lkKTsNCj4gDQo+
IC1zdGF0aWMgaW50IGFkNTM5OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAt
CQkJCWNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkNCj4gK3N0YXRpYyBpbnQgYWQ1Mzk4
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ICB7DQo+ICsJY29uc3Qgc3RydWN0
IGkyY19kZXZpY2VfaWQgKmlkID0gaTJjX2NsaWVudF9nZXRfZGV2aWNlX2lkKGNsaWVudCk7DQo+
ICAJc3RydWN0IHJlZ3VsYXRvcl9pbml0X2RhdGEgKmluaXRfZGF0YSA9IGRldl9nZXRfcGxhdGRh
dGEoJmNsaWVudC0NCj4gPmRldik7DQo+ICAJc3RydWN0IHJlZ3VsYXRvcl9jb25maWcgY29uZmln
ID0geyB9Ow0KPiAgCXN0cnVjdCBhZDUzOThfY2hpcF9pbmZvICpjaGlwOw0KPiBAQCAtMjU0LDcg
KzI1NCw3IEBAIHN0YXRpYyBpbnQgYWQ1Mzk4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQsICB9DQo+IA0KPiAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGFkNTM5OF9kcml2ZXIgPSB7
DQo+IC0JLnByb2JlID0gYWQ1Mzk4X3Byb2JlLA0KPiArCS5wcm9iZV9uZXcgPSBhZDUzOThfcHJv
YmUsDQo+ICAJLmRyaXZlcgkJPSB7DQo+ICAJCS5uYW1lCT0gImFkNTM5OCIsDQo+ICAJfSwNCj4g
LS0NCj4gMi4zOC4xDQoNCg==
