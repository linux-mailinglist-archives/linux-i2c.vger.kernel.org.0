Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883D1631D43
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 10:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbiKUJt4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 04:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbiKUJtd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 04:49:33 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF9F205E8;
        Mon, 21 Nov 2022 01:48:35 -0800 (PST)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL8gELe022011;
        Mon, 21 Nov 2022 04:48:22 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3kxsvaubkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 04:48:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuvSwwNXtU+GlNmDNw/AHwcwozNvdnLsa1JnBq9McZn6BICRtc2nFKsGLwDnG7d8XJAxT0bebBEePhydIbVikcsaWmF3d7mlrpqZoh4+oYQ4KqXHeMUX4elFvgCP5LoXFpgsK3ZoRoXxIrlbhnz+Vi2//afu9nnUj8u1+2ZwBQ/yIvVlQKMJk1iI8QoOVP+/dN2IIf5rkO3r2XOiBRlSFJLuzoVEhZIOcrUDihlzkjTrdEXOJ+yqeTYuraauNAxFowbWgDDoZAS5HKSwSKuw/C3PgH2IxNeFh4L2mS3qX8qnLW3gh8HcYMYENK61p9lyRi4ZIjiDVkUZb4CBROPoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aplZqr+UM16/I3CcjTLscxjzXdXwcG0mIcezaiJJ6MY=;
 b=hffqVPW+QKTXd0dA1/HGevjmdFcXhrGPY/1QPNosx9aB4Pre9vk5XlPf+vCyLpdYlpSXiRNWglSq4Z8y9w0aEEIcRu39i4RLqCn89f07s84FUMpPdl2zjYFew4wbTxd62J9uA63nZgYAe+kR3D9WK7Wcn7BUZ1piDKTGkAstmFw/Wbk9vH83Ktm0NTgmSg/zli3yDcrSLchYaS5ndVrOw39L+Wm0q+orfRLbb+BGJy3MSBxeBx+x13NlNPZlg3Ha4OylYjygvkad/yT6xI7KaB6Vh8kSv2rRVIOiiYotJd3P+wZ+Zr5O8E/2dNmK9fdoRz4TDUjOt8XsXR8ZXuuedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aplZqr+UM16/I3CcjTLscxjzXdXwcG0mIcezaiJJ6MY=;
 b=mHCZOTmlInekRROJBbGf+Yn/Pan7Yb+o3hShCBSWVKVF1SL+eJDaTU+Naybp0XBXe7COdPhYehzG6DVHxn/eW5nWxS03/yYVkObV7kStTwkip1NFjsukOdyj/BuLAucraCWSdVUm1U3l3lh5W+EV0bguF9QKOs4agVmgOUrj+b0=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by SJ0PR03MB5870.namprd03.prod.outlook.com (2603:10b6:a03:2de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 09:48:14 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::1ebb:3664:c148:f2a0%6]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 09:48:14 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 192/606] Input: adp5588-keys - Convert to i2c's
 .probe_new()
Thread-Topic: [PATCH 192/606] Input: adp5588-keys - Convert to i2c's
 .probe_new()
Thread-Index: AQHY+5+vU/RPIw1tAEyT/k0oudbzJ65JJRwA
Date:   Mon, 21 Nov 2022 09:48:14 +0000
Message-ID: <SJ0PR03MB625396B0DD0E58C3DD50E7138E0A9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-193-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-193-uwe@kleine-koenig.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTA1WXpsbFlXUmxOQzAyT1RneExURXhaV1F0WWpjeE1pMWlZMll4?=
 =?utf-8?B?TnpGak5EYzJNVGxjWVcxbExYUmxjM1JjT1dNNVpXRmtaVFl0TmprNE1TMHhN?=
 =?utf-8?B?V1ZrTFdJM01USXRZbU5tTVRjeFl6UTNOakU1WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXlNRFU0SWlCMFBTSXhNek14TXpRNU56WTVNamMzT1Rjd09ESWlJR2c5SWxW?=
 =?utf-8?B?UU4xWjJaRXhxVjBkV2QxVlRiVFJ2VDJkc1VVdDFkV2QzTkQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUW1GRUwxcGxhbll6V1VGVGNrUklia2R3YjJWWldV?=
 =?utf-8?B?dHpUV1ZqWVcxb05XaG5SRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-office365-filtering-correlation-id: 4d15cf74-9eec-44eb-9573-08dacba58248
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9lKV+bzOkRV9uHjcXnjl5hJcrUkjJrNO+1OeosKIfrYaTTzropF88jSqhomAC/IX0bPNmiTL66OZ+/yOLTFOHR7ntqeOJBF2JSAL33t/VsP/TAH4PbGnK1Hs2AkuNdUrKiDE792mVVq+Dr8W5wbH9JHkP28kxth2pyF5f1604WLgUyU2db95xic2Zf3TkJRf1F+nyyWV6c/v1cSiTx2HohcxflMh4StSyBTxc1fp0B97sZJmJtgb7ZMtSR1Hth/ViadgYxgAI952koNEDypSgbgO2p0KxCUPdTgvMXeQUT09MO1Y9GqUxk7qAfFYoc2O2iuHE7c2+cWS+Xyum+c7wi9ZssnjQCoA9baL36v0q1Aih0mH/CRJtS83lwwU6eN+lNiMUgjQ8ucdz+BhQqQ7bb0GLp+ptccqZOW9Rfe37HbwQOzcBjEon7+wgS92P67CtZRUDG/Fv/K6Hv+oXsAIYJwbD7uBxjNDLKZtMJ4wd0+GUXpAWGPwRwsql+wa/Qf3RGAPnPCy+m9Mj7oF18zZT9EHuvC4EIkz6+grxS+XF3u4Z81cluxtE1RrfTJ3AyJoENGbhvPZ6JzvQztGRwFeiqKHIFHWloqOu7p/4fw9gFW+PcwXuCAWXFicoy86zdr2kLMQM8UDpOgYUED4VrperZkJwfngBGIZJcCy8w1UqUtg8d0EkOw/dj/hNA55Sj2yGPJgWPy/yqxNGuybTref6dN19cgO3qar5txoPRrbHxQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(6506007)(186003)(7696005)(9686003)(53546011)(110136005)(2906002)(478600001)(71200400001)(122000001)(38100700002)(38070700005)(55016003)(83380400001)(33656002)(86362001)(26005)(7416002)(8936002)(41300700001)(66946007)(76116006)(64756008)(66556008)(66446008)(8676002)(66476007)(52536014)(4326008)(5660300002)(316002)(54906003)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmpXbm14Zjl6Wi9BRCtXQzlTRHcvd0xBQW1sd2VNbFdwYkZYd0FkSnlGN1c2?=
 =?utf-8?B?b2N5aXZkRDJtckRnVGVMVzloaFl4VXp2SVd3RUVqUjVIWDMwbFFpS1oxWWEy?=
 =?utf-8?B?VVpQSXgvNVRqNkdXSXpvMkVCNGlaYytlRzQ3dUN0NzZuT1Npdmx0NTZzZk1J?=
 =?utf-8?B?Y0hqOExwYWRpYUdkVVBubGRHMFZ4VXVudFM3S2R4bURERkJBdlVSSjF0Qjlx?=
 =?utf-8?B?cW8vRVpJUGdoM2hkMVMvNmpzSzlxcE1sbUZoZ2RkUjFnUjZzT2VtTTNOL3NL?=
 =?utf-8?B?UEVyZEVsNkFkc0pHUHhlck1GazREYnVKMXpWVjhhMHBoNVc0TWtCSmdkVzhI?=
 =?utf-8?B?eVJPNEdmeGhoYlExMmhQUFQ1RURmaGhkaFk4R0pTQWN4OVdWRWwwbUJqbm9P?=
 =?utf-8?B?cVZETGlac0NBZ0xSa2xtL2M2QVVYd2FVWnlzRTg2b1JvdjZRZi9JbkJxK1c4?=
 =?utf-8?B?c09PUStFbXd2MDMreVBQR1YydVdoU1MwZFhvK0V1S05tc0JENXR6VGZ5TUcw?=
 =?utf-8?B?ejJ6NU1CdVNYT21Ed0hEa0g2NVpEMzExYlFCY293bGZKZlo5SEd0UUxoRmhJ?=
 =?utf-8?B?dVoydndDNU1RVkV5T3JXRGZCUDNmNXlNd0xCMWpIbDhGcU1VZjJTT28yRHRN?=
 =?utf-8?B?RGdwQVZja1E2MTdoZlBtTE1VbzFVcE9oU0ZnZ1hPeDRBQzQ3U3V1cnJFVHQ1?=
 =?utf-8?B?K3hwdFhRT3RscFJhd09Zd2srVEJEOGlzejNqRmVMUE9xS0FLYmRLdEJVeGY2?=
 =?utf-8?B?WDJzTkwrajNEdmJJaERXY1R5aVJrUVYvMmdMSk1tZ3hscU9TM0VGS3p4QUgz?=
 =?utf-8?B?RXU3cUtwOHhldzA1cUVxa044UlQzb21oSVhQSy9wSWRtcTR1QVlOb0VmQWhm?=
 =?utf-8?B?cy9mTnRreHU1cWorNlpGUW1idjZ2b1ppL2RNc01HMHdtR2ZYeEZKWXduVE9n?=
 =?utf-8?B?MlpNWDIwSmN5OGlNdWVuQWlLSEZYNnE3T3NOZE9kSWlsN2E5RjQrSHdLN0Qy?=
 =?utf-8?B?Qlh1Z28wRDA1ZVBSUkhKV3pZN0x6dTBiTWx2UGNnOVpWUStWa0FLQUJlcDMz?=
 =?utf-8?B?dmFrc1VnK212U05ScXBEMDkrNDlBdGI3a1FqR25kRWNyOU45VUdjT1I2a1ZU?=
 =?utf-8?B?Mm05MXRsWXUxR1dWTjNFMHp4V24xZjJuaEZmQzVOUWxOdElmeW1BWmxLVG1P?=
 =?utf-8?B?RFlMc3VDSlhtQzVTTHhrNGpUR0lJdGJ4d09Td1R0dFVPZTVkZS9raGZGLzkz?=
 =?utf-8?B?S0ExbU9WbXVyZnU1VE42elZ2enFmWHV6NGYrb095V002aVJGaDhZNHNrZUlr?=
 =?utf-8?B?elA4M3pmUE91L0pPUkxPdFhBRkN4QVJ4VHpabmhEQ0dpdXNKRXl0cnB2R0dL?=
 =?utf-8?B?MUFuY3pxRzlkdENsVnFaRk9xcG54UTY0R2hQSDNLZlI5ZmRGTDNsV1p2dXFv?=
 =?utf-8?B?SVNsOUc2amFmUFNnSFU4aC9iRElyUlJVQkxKVGJmUTJFczlZY2Zka2V1dWdX?=
 =?utf-8?B?cjRnTCtqNVJjNzE4QmZpcEowa3JvZEpDQ3ZSbEdXTEIrM1gyNGR1Tk9WNUJO?=
 =?utf-8?B?UEFHcFFNQkdIcnZ0cHFvVnMxWlA4MDAzekhUS3FyZ1pobXZ6OWtjQmZsdnpJ?=
 =?utf-8?B?SEFyV2xyUlFVMmsvTnFHTmN4dmtQNDNlVXE1ZW9NWGYzL3I4NVo3WU9LV1hH?=
 =?utf-8?B?akVYTDB0T3phWjZXZWlGaDJZWGN1Und6d2tvOFRZSWZQdEJLM1pseHdsNDBs?=
 =?utf-8?B?d0wvc21kY0ptTSthSy9DOWVJQ0loOGlxUVdKdG9TSXdZd3h0clNjR0FSWTE3?=
 =?utf-8?B?eVRvb2VBNUhoWnZ5cCs4OHZac2xXK3BuaWNwYnhIdGNOdGlhSHNZK3lmUVZP?=
 =?utf-8?B?WndhWGprMi9YWUVPTkhwbFV4ditYRWxXczhoTE1XQU5WNk9qcjF3WHE1K0xF?=
 =?utf-8?B?ZmlvMjFUNVhma09EYzVrbGVuM3MxUWd4NjcyK1hvTEZIaTZyRVdFV3kyMFI1?=
 =?utf-8?B?UlNaWkRkYXRDL0t1QkFZTnNwRUR3VVBMNTBqQW1saHE0amF1NTg1dnYzcEdC?=
 =?utf-8?B?RVV3YThxZkphSFBZV09qc1FYNGtXQ0ltWkF0cEkwa1ZVVlFvdXp2dVhQekJW?=
 =?utf-8?B?WmdhZzFBcjVESkEzMWx0eC9rWDkxelo4SWF1cjZYS3d6R3ZNMTZWOGpCM1Zj?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d15cf74-9eec-44eb-9573-08dacba58248
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 09:48:14.2027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4wDk5CQxE8f4/mhpqYN5Rz2A1LnW9bquTqDhjn+b6ILrYMaloxZ6cVDQfsHndRnQzenuaSzLU4e7AU8+HEgpOHrr/gMmnzKT8DC6PS9TXd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5870
X-Proofpoint-GUID: GBL6AiN1JzoaNUagMvgq80lXsCMRXagN
X-Proofpoint-ORIG-GUID: GBL6AiN1JzoaNUagMvgq80lXsCMRXagN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210077
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
IDIwMjIgMjM6MzkNCj4gVG86IEFuZ2VsIElnbGVzaWFzIDxhbmcuaWdsZXNpYXNnQGdtYWlsLmNv
bT47IExlZSBKb25lcw0KPiA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBHcmFudCBMaWtlbHkgPGdy
YW50Lmxpa2VseUBsaW5hcm8ub3JnPjsgV29sZnJhbQ0KPiBTYW5nIDx3c2FAa2VybmVsLm9yZz47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IERt
aXRyeSBUb3Jva2hvdg0KPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gQ2M6IGxpbnV4
LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgVXdlIEtsZWluZS1L
w7ZuaWcNCj4gPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT47IGxpbnV4LWlucHV0QHZn
ZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogW1BBVENIIDE5Mi82MDZdIElucHV0OiBhZHA1NTg4LWtleXMgLSBDb252ZXJ0IHRvIGkyYydz
DQo+IC5wcm9iZV9uZXcoKQ0KPiANCj4gDQo+IEZyb206IFV3ZSBLbGVpbmUtS8O2bmlnIDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQo+IA0KPiBUaGUgcHJvYmUgZnVuY3Rpb24gZG9l
c24ndCBtYWtlIHVzZSBvZiB0aGUgaTJjX2RldmljZV9pZCAqIHBhcmFtZXRlciBzbyBpdA0KPiBj
YW4gYmUgdHJpdmlhbGx5IGNvbnZlcnRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNCkFja2VkLWJ5OiBN
aWNoYWVsIEhlbm5lcmljaCA8bWljaGFlbC5oZW5uZXJpY2hAYW5hbG9nLmNvbT4NCg0KPiAtLS0N
Cj4gIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMgfCA1ICsrLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMNCj4gYi9kcml2
ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+IGluZGV4IDdjZDgzYzhlNzExMC4u
NzJhZTVjZTcyOTU2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1
ODgta2V5cy5jDQo+ICsrKyBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMN
Cj4gQEAgLTcxOCw4ICs3MTgsNyBAQCBzdGF0aWMgdm9pZCBhZHA1NTg4X2Rpc2FibGVfcmVndWxh
dG9yKHZvaWQgKnJlZykNCj4gIAlyZWd1bGF0b3JfZGlzYWJsZShyZWcpOw0KPiAgfQ0KPiANCj4g
LXN0YXRpYyBpbnQgYWRwNTU4OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiAt
CQkJIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkICppZCkNCj4gK3N0YXRpYyBpbnQgYWRwNTU4
OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiAgew0KPiAgCXN0cnVjdCBhZHA1
NTg4X2twYWQgKmtwYWQ7DQo+ICAJc3RydWN0IGlucHV0X2RldiAqaW5wdXQ7DQo+IEBAIC04Njcs
NyArODY2LDcgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGFkcDU1ODhfZHJpdmVyID0gew0K
PiAgCQkub2ZfbWF0Y2hfdGFibGUgPSBhZHA1NTg4X29mX21hdGNoLA0KPiAgCQkucG0gICA9IHBt
X3NsZWVwX3B0cigmYWRwNTU4OF9kZXZfcG1fb3BzKSwNCj4gIAl9LA0KPiAtCS5wcm9iZSAgICA9
IGFkcDU1ODhfcHJvYmUsDQo+ICsJLnByb2JlX25ldyA9IGFkcDU1ODhfcHJvYmUsDQo+ICAJLnJl
bW92ZSAgID0gYWRwNTU4OF9yZW1vdmUsDQo+ICAJLmlkX3RhYmxlID0gYWRwNTU4OF9pZCwNCj4g
IH07DQo+IC0tDQo+IDIuMzguMQ0KDQo=
