Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0E867400B5
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 18:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjF0QSc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 12:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjF0QSZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 12:18:25 -0400
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F7B116;
        Tue, 27 Jun 2023 09:18:24 -0700 (PDT)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35R9OXvG024161;
        Tue, 27 Jun 2023 12:13:04 -0400
Received: from can01-yqb-obe.outbound.protection.outlook.com (mail-yqbcan01lp2234.outbound.protection.outlook.com [104.47.75.234])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3rdwd41vc1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jun 2023 12:13:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHMw32WROQg8PqSRgT+n5ALUCfXlSwuTkBcmsZ25Z07xel2su3svcb1bXyVtzTUNhashAET0WY0fVtnj5xbwZpZhJh1Aw1BXyc0y2YWDlLPK6whBczALlH5yKsyo0v7mrb3HsY6pX305Lcv0dpBPdj0CYOXMjG5UY2ER0DyZRsct4ranVBKBV5EyTT/VR7xzaJur0S6xamhW+QzITE0ud+3C2HMezexnK9avlJPk00e9X7gh0Kyy0YFWpdKmvYN25cqA/dgDJ6JzKPgmfDGow+7APSXEP9xHwC6liEeW/onSRTgF/h7aQag68kiraIxjvKXBgqvGqGnAYuoiOeAbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1nhkzPuxY1/xN2h7oBa2o3Mc2+4uk4tSRaTm5u2Zw4=;
 b=hChCRDDOt2I3Ch0VK5UXjgJUgRd7/Q7xziYpaN/Fp93bg2ZXJbzraLNlJ3lLjOHmKofIqoqe7ubPprgNe7xY0qsl3Rzf2U51fbYDztiRDnd8IS8/4DdrRl1WqZ2LqLGeJqYS+17Ei5uSrBR6hkArALkHR0mDK9pWcgpO77bzcb2HlxfRsdBO0M8G3lSgs+oG/FeFI2rPon2h57LdG6RUXyHsuq8VH0/uQdjxApqZY44Lfg4+OAorTz3vUKnj5bbGKpmUKRSEMnGUTHverZZtxkkIN81Cgc/v+0B9iQP5K3bOi9RMLaEYGQRkRosvN9aJGiyjYU2lO4aRhmcFoAeCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1nhkzPuxY1/xN2h7oBa2o3Mc2+4uk4tSRaTm5u2Zw4=;
 b=QYLKXT/EFw7yCyqzouteQkPBiVwAl+YqC4QDcKzJM82sx4Q9FjNjVqPsBALU9KC4COw4+WxMGj3btjYmldPNwaJBwGTIobDWSnGjEb45a/vqLL2O2VY4gcFec4hnaLcjeSt6dB2T6Fx7h011POl5bjd15fJU4LOPTqfbi9rPGzU=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT2PR01MB5565.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 16:13:02 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d38f:77f6:a:b41b]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d38f:77f6:a:b41b%2]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 16:13:02 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "wsa@kernel.org" <wsa@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Thread-Topic: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Thread-Index: AQHZmKRr5HCKlPlB4kiPAHoGiUQ0I69+J9qAgAAES4CAABwegIAEVbYAgABirQCAG/KPAA==
Date:   Tue, 27 Jun 2023 16:13:02 +0000
Message-ID: <71637721f64b877255264d36293208402ef1a873.camel@calian.com>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
         <20230606192453.zjzz4kt76kus5hr5@intel.intel>
         <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
         <20230606212053.bwpoxyost4fkpati@intel.intel> <ZINGGmRLYEQ+NfkI@shikoro>
         <20230609212552.5o6aopv7iicej3kn@intel.intel>
In-Reply-To: <20230609212552.5o6aopv7iicej3kn@intel.intel>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT2PR01MB5565:EE_
x-ms-office365-filtering-correlation-id: 0b9157da-66ca-4b60-6b2c-08db77296233
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QdrLrp/I+5YxhbNZ+K6n/xIQh860Cv3nE0JwVr3iUIME3XF4Kc++n5PHgDPoVKfPsHynTf8WKfjg/+6ESlFYwT07jeVgbZlvqs1qtOvwTN4QQFZ7+RVcSn7g5DeekraQf+Nw91+hAlOtn39abYsZRtoEtmUTN+Yp13SCOqnwkNCVd2xFHX6FBFY9DNfnMRlGlZuDuxI5IOd6IzGdXCXZp6x0gWABnkrWfOS38oUWIElNOgDfWEeUTlEjTPLOQBlhF5MqAnP+e3ZYAJemOeCQywGlVVpRuFBeGOorzzBZaY6WkWYK33TaO9mWCxKgculr9iM0hOX2rIHAa65TyHWxtwBW+HFmYReQX+yAvuFOubSTiW3D/H461pD1CpPfwl14QLES0ZiqMZCTTyo83rJ4vkqx0pS2a/8NuyZcly17zVr9yh1gGqTvruJ+H52MbqrR23FEjYrns2PngxX/8DyLUKYK1y2J38F9Ox9075yw4F552x+2ErFDCXuYQMNiR0G/EsUJ+MhqRuUDwm/Jbm500NvF989zZAq2ZdLXIA99ixvvPruj4lUngx72TC4Z//w112QhJKwotyVGwOvPkzR+BLP22qPMMFh5YpMUfpbYLoDZToAn73n4bP/zm8JJUmSz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(38070700005)(83380400001)(4744005)(186003)(71200400001)(6506007)(6512007)(91956017)(6486002)(76116006)(110136005)(478600001)(122000001)(86362001)(2616005)(66446008)(66476007)(66556008)(66946007)(41300700001)(316002)(36756003)(64756008)(8936002)(38100700002)(44832011)(5660300002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm5vUFc4dkswZk9lVlBHcHc2d1dyZUxRTit5QVdlclBPNlJvSGZ1WFdha2E3?=
 =?utf-8?B?RkxhWTlwdmNkYWV2Wk9uNkNVRDd5RkpGNHpVNGhqbWhMc0Fab1hXaFY3d1JG?=
 =?utf-8?B?Z1lSSm9laTNrZ240cjJGdzltK1FvM250TWdjcWx3eExjV21lZkxIRlQ3TW9y?=
 =?utf-8?B?bGJJbVVZTjVEc3R0aDZDQTQ4V3FpRVoxK0R2VllHVllSREQ2bHlpak01bVlM?=
 =?utf-8?B?Tk51RU5MNGJpQ3JuRi9lSTN5U1BsNjU4R3pHSG9EM1lxT2VDM3dPbS93SFcw?=
 =?utf-8?B?ZUM1eFBVVUZpY08ybVYyZWtubXdRYTNSb0NKZnVNYTQyQlEzNmR6SXkrTUUr?=
 =?utf-8?B?Wkx6YkgzMmtSOHRVV09iV2hXRFBZRzBRMTFLZ3dqNElvSmFva3NZeUt1cHdF?=
 =?utf-8?B?TXh2QVU3ZlhPVUpPVlN0VmNkR0ZTd2FwSlZmck5KdDlvYnJiM3YzV0ZOV3Nz?=
 =?utf-8?B?TVZuRk1uNlhiOWxRR3M3d1o0Y1JtZU5IR0xWWmxYZXdwdWZwSEY0OFNXcHpJ?=
 =?utf-8?B?Zmp0SHNRb21OMHBrOW9hSEh5L2lYSk0rZW50MDUxb0dkZDBtZGJ4R3Z6R0lF?=
 =?utf-8?B?T0lFUGRMUUREOFRiS0ZpV0NNWm54bTZLKzI2UHdQb3UvenZqQ0FneHdic1lm?=
 =?utf-8?B?QVVnYktOL2RUSUxDSCtLeFhleHRUdWQ5eFlwZ0V5L2RkVGJUbVFQbldJajMr?=
 =?utf-8?B?OWNDRXZPVWNBUERNUnFRRkNzZ2h2QVNNSDFaaHorVXpwclpSTytoRVpSV1Vm?=
 =?utf-8?B?a2hEUDJHU3dQMFN4c29xRzZLMGcvZXRCNzlCVmdraE9vSERvTldFcmc5a1Bk?=
 =?utf-8?B?NmFja2dUN0F5MlBadDBqeTR6R1IyWkp2alMxdEtNVTJkeTVWV28zK1c5a0ZJ?=
 =?utf-8?B?T3RINXluV1VYS096QjdGU3ZIRnV6UklMd0VKZmxZeSs3My9EenJjaU4wV1Rj?=
 =?utf-8?B?dTNjellEK040aFVJT2V1dVY0SW1qUmh1Z1RWVjhaMkFqL1g5Zk41VTVYOWF4?=
 =?utf-8?B?cGFmQkVwelRTb0RYaVF6QUkwR2RqUEc1RTQxMXB6cGpkYTczei81RTJUeEIx?=
 =?utf-8?B?RzI1b25peW56emJpQzZrVVBscEpUbnRmNjdRTWdGUy9Dd0hFVklGT08wazB2?=
 =?utf-8?B?UTVpZE56d0dvZkpwUWx1VWlmZnBDVCtzbjlSeTgzZ2JQRVgxYkpIQWUxbUQ4?=
 =?utf-8?B?c2pNeDNYb0Y4b0QrOU85T0FiTGxNUmJVazUyem4vOWN6a3EycXVRR0hiNVZZ?=
 =?utf-8?B?Z3dFWHRDSER5ZzVtVjI4dFVmdHUwMXRrZ2ZKcy8rTGdvOTBTRzFHZjhVNFRh?=
 =?utf-8?B?djFScGZuT1lHT2V6cy84YnU3VmhrdVpuNmV5Y2RwaEpqZkpXY1RMaEFXMzNx?=
 =?utf-8?B?V2VJUVFKQ1Z5MFJOVGtIR0xmRTdwMHJ4ZWVOSzRWU2hZVGhxZlZWdFdGN2RT?=
 =?utf-8?B?NmVhSHJRd2ViWTA2emsyYndnMkJKQ2NpZUl1Q0V2S3Zlb3BKcU51ZlYzYWR0?=
 =?utf-8?B?TkR2ZTlpa3ZsbnVTaUpIMll4VUljSmVkdUNNUzRJWS9KbkcxSGdoeXQ1WTZX?=
 =?utf-8?B?Rzd6N0tMcUl4aER2RUxaOWd3T0FJVG1TRE1Zb0tDWlN6UmRZbmFpQ3JNRFFI?=
 =?utf-8?B?ZmRXd3RBWEFJRklZTEMxenIrN0IydWxDMm1ZSUFzTmZJWkw4NWxWVTY1OUhi?=
 =?utf-8?B?V0F1ZlhrdjdyUUFGVlliY2ZqOUQ5d0JTNjFhTXNsRVVyOFh4UE1JUEdzdDI4?=
 =?utf-8?B?aTBJenRtb1h5bFg0bVpKVGwwdWVQOWFGOEFIVDF0dm5ncTMzWCtFa3lzdGNn?=
 =?utf-8?B?NkRjVTM3blVlK2xpSktJZU5CeThNUFhlVmRQZUZpZlpQeHM0amFqL2pYYmNn?=
 =?utf-8?B?OElyNGsxc0tjdVE1M3FwaUQxMnRhV2ZUZG9qVWFUNTZjNFNLbzJ0dVY0eXhB?=
 =?utf-8?B?bjIycE9zTEN1aDhGVkhLZnlxdUIyUlhSa3JmdXd6TWpPNTNZY05WWnErUWZr?=
 =?utf-8?B?R255UThiaDN5Zk9XT0dkVVpXa2VjdU5qOGRoT1A4MHovTjB1cVhJRzEyUHY0?=
 =?utf-8?B?dmVZS1lRRTBrM1lCTnVJeHduMzlDUGF6eS9kWGlibWtOVTRtZXZuclpoYk9x?=
 =?utf-8?B?cWJwcnlINFFrdTNYSjhoUHphL3Y3L3Nzczdobm96azNnRDc1bTFPSlJGaVYz?=
 =?utf-8?B?VThQM2dJMnJRUVBRZ1U4SGQyWEZvK2h3L2RKUGlQeHJ3MERONnhCOG5lcjVZ?=
 =?utf-8?B?UHBkc3ZGL0hsK2RRT0lvVmU1aWR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CE8AD3E6DFD8947A2A3817BCAB11F03@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ajUxR3lWWTJkRjA3c2NQcXkwdEFYOTJSUVd2R3BHYkJFZlNRcFoxTmtSQi8y?=
 =?utf-8?B?WFIxcmxXbk1vZGVMeFBCd05vQlFqUC9jSFlzL29qaEYwRk1XVU11RHZBU2Rs?=
 =?utf-8?B?OUhQWTdVSXZrOTNkQnc4UStvOFNaV2lMN3ZXQUFzelI0dmRJcENSZXV3dldD?=
 =?utf-8?B?R3IrZW0vL2s2YWxnZVZVY2dWc3UrREZubHVXNmNKdkthWmxtZzVjOWJNd2tD?=
 =?utf-8?B?bTdqay90Zmd0K3c4cUhlMk5HaFF1QitJd2c0ckxoT0I0ZTZlS05vbUdZajZY?=
 =?utf-8?B?UW1aSjh0SzdiWjBYLzI3M1lYeVlUY3RqQnRyY1JlUXhvL0Y0YTZyQjlOYk55?=
 =?utf-8?B?RXd1b1lrUHRIRmY5cE12L1FZNmxmaCs0MkZXZGJnL216SGRQQU5DaGZGS2tX?=
 =?utf-8?B?RkRDYzJkZmlKK1NUY1gwb3hDOTFydCtMUFNIV1FkR043T2pjemptcUh4dE42?=
 =?utf-8?B?LzI5enlrRk1rY3ZYdWx6cFdmOWo3Ylh6cXR0ZHNROHdMYUFpbTNsbUhYL1V1?=
 =?utf-8?B?WjhkaFVOSnFRSlVCSjJsOFlzMmRVZTJqWlFadU83ZDRpbk11MTFCSmNwUHdO?=
 =?utf-8?B?ZCt2a0xrMkhxTkxRVVpudGhPdzluaWowYThFa0RCM3B0RTV1NzZMTEFQZ2RP?=
 =?utf-8?B?TVNTTEhwUzhNL09VZi9GY0xwMTM1aElCSXF3MmQ0VUdHT1BBNVRZa2Exc0hx?=
 =?utf-8?B?bW1sQWRpelMxVUJEZW11ODFyTlhpd0lSVU90am9LdzlSQXhWYUsrZ1R6ejRj?=
 =?utf-8?B?OGhqbkZNcTFJMC84M2g4eEdaMHM0N0lzSCtFVnFValRqeWxleXdxZmxMZHNG?=
 =?utf-8?B?TmZnSTR1R015UkRsMEZ1SUJWaC9GVlVOYW0vaTJTSzBwWHBWeHNtZ2wzck93?=
 =?utf-8?B?YjJUeHRvUWZmWGxncWtqWVlha2IzSGFmZVd3dGp3M2czZysvUWpBU01WVWZ6?=
 =?utf-8?B?U1VCbUlkYVRpbzJHT0t6US9TQTIxQ09RaUZmYnN1NFVEYjB0YTlaVmVCLytV?=
 =?utf-8?B?T1lVTTNqa1ZxZVdEV1dZMUkrbXcxU3pTZ3Q3LzFEbStjYWNvbDRUL2pkT1Vt?=
 =?utf-8?B?VlpxU3N3em0rZTNML2haaGFzL2h6cThlUUVBRTg5cXZJNXltckRSdGNUQUk4?=
 =?utf-8?B?cUFaWjBDL0I2ZnZMY1R6UXM3d2I2ZVdEbHJGbGY1eWtSdTN3aTAvdE5IeWNN?=
 =?utf-8?B?ektLTnhQNUdBVkVxMlcyWlNLS3gvd1VVaUR5ZDRMZFNvNzd0ZmQyNktiVmkx?=
 =?utf-8?Q?1Wt36bcZLk5NF0y?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9157da-66ca-4b60-6b2c-08db77296233
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 16:13:02.7524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XEOtuM94YgxGcr1yTaAPnrYDggNMJcAbOtf2jW7YNfa183jjitVt6eWVcM4BnNJKM+AhzDnksve2og0ZPat4w/nGP5PN8I3xS2NyDg0r4XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5565
X-Proofpoint-GUID: GK0HqmI0QoIWAYuYprgb918c-Fjd9jGp
X-Proofpoint-ORIG-GUID: GK0HqmI0QoIWAYuYprgb918c-Fjd9jGp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=923 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306270147
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDIzOjI1ICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBI
aSBXb2xmcmFtLA0KPiANCj4gT24gRnJpLCBKdW4gMDksIDIwMjMgYXQgMDU6MzI6NDJQTSArMDIw
MCwgd3NhQGtlcm5lbC5vcmfCoHdyb3RlOg0KPiA+IA0KPiA+ID4gSSB0aGluayB0aGUgcGF0Y2gg
aXMgY29ycmVjdCBhbmQgSSB3aWxsIGFjayBpdDoNCj4gPiA+IA0KPiA+ID4gQWNrZWQtYnk6IEFu
ZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4NCj4gPiA+IA0KPiA+ID4gSSB0aGluaywg
dGhvdWdoLCB0aGF0IHRoaXMgbmVlZHMgYSBwcm9wZXIgZml4IGFuZCB0ZXN0aW5nLCBpbg0KPiA+
ID4gb3JkZXIgdG8gY292ZXIgYWxsIHRoZSBwb3NzaWJsZSBjb21iaW5hdGlvbnMuIFRoZSBzY2Vu
YXJpbyB5b3UNCj4gPiA+IGhpZ2hsaWdodGVkIGlzIGluZGVlZCBvbmUsIGJ1dCBub3Qgb25seSwg
cG90ZW50aWFsIHNpdHVhdGlvbiB0aGF0DQo+ID4gPiBjb3VsZCBhcmlzZS4NCj4gPiA+IA0KPiA+
ID4gQ2FuIEkganVzdCBhc2sgeW91IHRvIHdyaXRlIGEgYml0IG1vcmUgaW4gdGhlIGNvbW1lbnQg
dG8NCj4gPiA+IGhpZ2hsaWdodCB0aGUgcG9zc2libGUgZmFpbHVyZT8NCj4gPiANCj4gPiBJIHRl
bmQgdG8gYXBwbHkgaXQgdG8gZm9yLWN1cnJlbnQgYmVjYXVzZSBpdCBpbXByb3ZlcyB0aGUNCj4g
PiBzaXR1YXRpb24uDQo+ID4gRnVydGhlciBpbXByb3ZlbWVudHMgY291bGQgYmUgbWFkZSBpbmNy
ZW1lbnRhbGx5PyBEJ2FjY29yZA0KPiA+IGV2ZXJ5b25lPw0KPiA+IA0KPiANCj4gT0sgd2l0aCB0
aGF0IQ0KPiANCj4gVGhhbmtzLA0KPiBBbmRpDQoNCkp1c3QgY2hlY2tpbmcgb24gdGhpcyBwYXRj
aCwgd2FzIGl0IG1lcmdlZD8gSXQgc2hvd3MgYWNjZXB0ZWQgaW4NClBhdGNod29yaywgYnV0IEkn
bSBub3Qgc2VlaW5nIGl0IGluIHRoZSBHaXQgdHJlZS4NCg0KLS0gDQpSb2JlcnQgSGFuY29jayA8
cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCg==
