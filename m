Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD8A724DBD
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jun 2023 22:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239685AbjFFUL5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Jun 2023 16:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239686AbjFFUL4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Jun 2023 16:11:56 -0400
X-Greylist: delayed 1877 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Jun 2023 13:11:54 PDT
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA3010F2;
        Tue,  6 Jun 2023 13:11:54 -0700 (PDT)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356JUgtb021328;
        Tue, 6 Jun 2023 15:40:17 -0400
Received: from can01-yt3-obe.outbound.protection.outlook.com (mail-yt3can01lp2177.outbound.protection.outlook.com [104.47.75.177])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3r2b13006v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jun 2023 15:40:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsuGGAZoFUS2z96+Lv4gHxZWuxY9h6boMBQh8OWeBmTPgkgjddrSBtAFwBL5l0fLRHk03b9x9CquMMEcOGjVA3lzrlGq0jMCzBJasdTrr9qD+RQdquxzx0CHD8V+CjeYTWFkQ7gQVlCtmGj9CMfDxSOxJTXV+mGCz8m6HLYQbaR0SbZJDdTMgVpdsYEwTSH0fhf8ykVKGeKM/zlKc+bHqW7KygcnlOJ3m3ZoTpC31fn0jOGH4G5lMZH1PgBQ4H0qj4L8Kk3P4jkMa5pRDuvPkN+XIW+lGSbDwQR6yEbpV8ePY/Ogg+jHsc/MkziaSSA6dwh5DY7iCUymu+8oLwlchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN71xGVuGwJ+gFwEh4MVX1VU98ksuQfAcWKKPbmNL+Y=;
 b=MIyJFojxnzDC2ONuOmG8/JEtrvdpUpHktAHg84Y3xrgRsUI4rpBMrpBb/ez0wk/OGIVl9/PGAry7wgXCk2HMK68g/DnhouOGw5wBJNo4MW4+Q8UlInRVb9B4ReCQ7jaA9RcctnZUbq0aa1KkTUzO8GpoFCNVJMwVDRpR4ZSRO/FRYt1sAYYDrzvTAjajZ+NKmuXxcpNJ1PqUrsiZqoJsiozUzLfNRXH2Rf4Pdn82GlkGTBztaCBm7QcOypm4ckV1d0rkgziqStbqTGyDSoMBriCoBWS4KV5dB+/wPr/69wQZhrri3ruwWDWIxtlz0hcwXmahS8bPcW505HrolVql2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GN71xGVuGwJ+gFwEh4MVX1VU98ksuQfAcWKKPbmNL+Y=;
 b=p6krLU1pHSSzjgA81c5+HN8WowdqTOH/fNdUyxFnNg6X9+nOYLTwaFMLYyuIgX5WpUY68pg0fqu+yVv7P5XkSfieP4CLwl2mzql4Ty2oH8g/HUJgiZALonsbxUDhExFj1Ui3FrAlWTNzsitgVzwV5inR06nXvV3Z7u1fRIvf4XA=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YT2PR01MB8629.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 19:40:15 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::c059:dcd5:ca20:4a0]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::c059:dcd5:ca20:4a0%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 19:40:15 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC:     "michal.simek@amd.com" <michal.simek@amd.com>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Thread-Topic: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Thread-Index: AQHZmKRr5HCKlPlB4kiPAHoGiUQ0I69+J9qAgAAES4A=
Date:   Tue, 6 Jun 2023 19:40:15 +0000
Message-ID: <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
         <20230606192453.zjzz4kt76kus5hr5@intel.intel>
In-Reply-To: <20230606192453.zjzz4kt76kus5hr5@intel.intel>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT2PR01MB8838:EE_|YT2PR01MB8629:EE_
x-ms-office365-filtering-correlation-id: be8957e3-5574-4e35-f1cb-08db66c5da36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xz9ab05ODXbqTA/yMiBA9sCvhWVp/6/9PhEjFWxAHwWzdJdEDZVYYvD8rfiwQq2LFGyGsAtVYmxtKAZeZanjWLrm/hqNOVkdFkCBN48Befu00hkGhke9IjcGnLG83VozdiFNxckgpzog2NLZb3PiQuOnpRl7vFBjHFc3+OJ2oCLnZ9QAkJCroqWifnt+HyKPUivPPwPHXgbmfMBw4l9Sat4PDNalIFK0xhe1WM0tDrmaDWKMJBEoSVlYCf+wGqMGCP+yT5toPhMU4FDpEth6D4w91tamOvMTaMEzHbL4dpV/142jXqUiF7Y+SwXmBW+M6GQpB1C+mZ0QuCFPahcnyGU4b1X8D3CDM7NvwB1zhGeE+QhKo8sh2m49UbawEbG1zBeNUqTHpFraIDW08FPJFasIplovNt57wxEf2AEKsQniFQ/t4n/TIAxW9qFs7XYiIumqV+zQ7Z0VHqeDDVc0IbVPCPBC3q8szEi/5Zu19ZeQ2CFfkiUnXc75MA1YaOY44H5kibIy71VqTX0eW1b+RY8IwPYMpMf7u33m5pE53TfkZEBHfprkb9N3RK2fGlzhahi3/Jfr0PEE/PeKsA5cM1Q73SzX8EDBy2NPfCZxH8HbhBbH8bqJDm/YUhGrb264PhSzfQv5N6vzQ6/AKX/HHR2Jq9ThyqL7bi+Ru5pu/lo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(36756003)(38070700005)(2906002)(86362001)(5660300002)(44832011)(71200400001)(6486002)(83380400001)(6506007)(6512007)(478600001)(316002)(54906003)(91956017)(186003)(64756008)(38100700002)(41300700001)(76116006)(66446008)(66946007)(4326008)(2616005)(66476007)(122000001)(66556008)(6916009)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3VhQS9LMjdVSUtzcTIxdTFnSlpPU0lIcEJJVHVpSWdvSjNzT1pjRzB2TE4y?=
 =?utf-8?B?TUd1M1J0STdURGQ2blpUQTNNOFB3L0hEWlFEQXhoelk1dEpKekJHSEFxUzE3?=
 =?utf-8?B?YTNhUWx5b2l4N29xbjhFVkRoU3hWcXh5ZHVRdGRxSDhZVEVGU1FGUHcydXpk?=
 =?utf-8?B?U3pFcVdobGkrdVkzTHFLSU1KS3Zmcm1UL3lQek5adXNmSm80bXluQmxwUmEx?=
 =?utf-8?B?LzFpQzhhZmQ1VnM2WHdOcjZFVkpkN3pGczRocVFyZTNTL0o1QU1NOGQ4TVpL?=
 =?utf-8?B?U0NzVjdNTFFkNmd6MTkreW43UFFySmJkZGx4Wk1JOEFjY0RvdTdGT1hHeW9O?=
 =?utf-8?B?d3Mrd3B1bk11ZGxPZWNJa3ZUUGV6UUhDendXM25IM3V4eXYwaEZCeUtBWjBz?=
 =?utf-8?B?cCszUzNmQUJTTHB1ZFIwUFk4emc2SmNWWk4xVjB2V1dCZzRHOTNyVmlTSlBX?=
 =?utf-8?B?bEZMS0RHcGg4U3pVYU9GdnZKRitiZkJ4MHUreUJSQ0lWV25uVHVSblZSUG95?=
 =?utf-8?B?S1FFcmJ1c2VQNXdYR1lPSUd3c2hIdHZWS0NKVi9ZdHlnMjM0K3JlU05paGVL?=
 =?utf-8?B?NzA1YmloQUxDaWdxdEttaGMrYkoyejVqZEV0ZXhJWjRscWJySk9sVEJMY3lE?=
 =?utf-8?B?eldHT0hwN0MvSjBNeW16ZkU0Ym5tQ0d3MkV4TVQ0ZFpNd2VlNG55Qk9uNFo4?=
 =?utf-8?B?MVVGU2FSSmhZeXA2S3B4NXZiYzd1N0hyc2FPMVF4SURMdzFUNFBpa2NjWmsx?=
 =?utf-8?B?MkhkSGdBMDFwUW14cWJsaGY2bjZCQXBEVDNPMnQ0dXBrakJwZnZiS3c4STgr?=
 =?utf-8?B?Z1hPVVhuM3c1amJVREFqejZWTGRXUE5vMUt0bDY5TTZoUGZaUDZJUlVuSW4v?=
 =?utf-8?B?NVlQbUoxS2VtTU9uVTFtYzNycmZpZ3IvNHc1YWdHdHFWT3pBMlc0U3Fzblhj?=
 =?utf-8?B?Sit0VTZaeXVpa3B0ZDdOL2VjV0JJcmhyOHNwSzlzT1V4cU91Yk1Xd2EvZi9r?=
 =?utf-8?B?aXVLU0RIL1RCT0EzOGJqMW5BcEJMR3R3dXFJNXMveURxYmZvY1lDeDVXOUlD?=
 =?utf-8?B?ekJHRlR1OEMyMlVESmVZMzRnQnVrdUxJR252RFJGRXpnV0hyWU5WdFIraVU0?=
 =?utf-8?B?ZXBFK2l1c3RBK0JKdjlNRzNCRkVvVnM1MGdGZmE0N0V3aUNnUlVmaHlnTmE4?=
 =?utf-8?B?MVZ1bkNqTzEwWVFZQ3JtWm0xQUNvUE1hK3ZzVFJIdVdGc1hNMXU5MDhYS3o1?=
 =?utf-8?B?N0JKYnNuWm1VUlZTNDFhWmhlOG1aYzBYV1U2OXppR1VkY2NpcXV2WFFvaW9D?=
 =?utf-8?B?TzRmak1RMGFqUEVDbGk0cXRCVWdFTEJxOVNRTnppTUw2LzBVVEVDK0U3QVpp?=
 =?utf-8?B?R3NoU3cyampxY2hsczJHNzFWRXpSaCszTHZWRFZ3Zy9VMHR5d2VKZFVFZXlH?=
 =?utf-8?B?cjBVbkcycndMeGdESDNmN3d3Y25lRmVoUkRuUEtiWXdOVmhVQ1Q0dm5HOG9Z?=
 =?utf-8?B?VXBQOG9obWdGUHVGR2VhV1grVGQ3aGs1a21VVGsvVEQ4RG0wRUdGenBtZFJB?=
 =?utf-8?B?VXdKNlVCVVFZb1N2dUUzTVF2TmtiTWJCQnZQOGxWV3JHWGprdTVOY0VhRlB0?=
 =?utf-8?B?YWsxT0VUMjRXVzJpdnEyUUNuUU5YejZPMTlOVzRkOHVyWUxsVG9JajYxMDVo?=
 =?utf-8?B?dUsvNnRiaEk5ZndHWERaQVVMVjZ2ZjdRcXUrb1U1RFlXcGQzdjNSdGhYblFa?=
 =?utf-8?B?WmN6bW4zV3ZFOTEvT2dOalRHd0kvWFBvL1hHeVFLdVA0U2tvU2JwOHAvbnJU?=
 =?utf-8?B?WXpDRHFINDc3ZmFxUjgzdnR5c1JxSzAybGpOVWhjQy9hcGZRVHRwL2JWYXE5?=
 =?utf-8?B?ODRBSGxVcFFMZFRVWnoyb0pwY0o1bVdhRmRDZ2pYRUdvS1JnelRjdEM2K0hC?=
 =?utf-8?B?N2tFQzhKQUtqZ29wNW5CUjAzSDJtVVk5RnlZc2xGSmpwS1NaNkhodUhlZ2Z0?=
 =?utf-8?B?YmtqdFE2RzBKUUZCNUxXa1FZK2hKS0pSQkY5Tk4zSmxFNWI0cTFSM0JVN3Ba?=
 =?utf-8?B?c2ZmTTd1bHhtSnZ6QVhtVVJ1OEYzSUM3MVF3RFFKNDh2YllJK0RYVnV0dzhC?=
 =?utf-8?B?UkhNK1l3VzRWNTg0OFYrS29CSWR5VERFaGJid1A3RGMvMFRuRU0xaTFXMTc3?=
 =?utf-8?B?NzhtY3QzUVdXNEJxRFR0NENUb0FxdXhQTUxOV2MxNU1XeEhmTmMydGhpMmxU?=
 =?utf-8?B?TG5jMVBIbmYwTXVrR1BFc3BFaVlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91FDBB8E9225ED4BB7D6EC8733A69858@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bkFSSFdIQkRKM3BSMVVNY3NtQTVoNFR4SzNsZUI2d2tVQlJMNks3TjFvRlA5?=
 =?utf-8?B?VytWYzI0d0dkZlFoNytUWHZwcjh0aUpQWm84WmtySzRSOExCSUtiWGRBTGRL?=
 =?utf-8?B?dGlUT2dLYTMzVUhGVHRtVSs1Si91ZVg3NFgzTExYKy9KaE9XRGxPc1VBSXpD?=
 =?utf-8?B?aGc2d3pqRWEzSkhMUDVmdm1JWUV1WHFlYkZpbjBSZWFzZW8zRkd4anFsRUI1?=
 =?utf-8?B?bXR1Ujc5NXFJb3BsVktON1hOSXhUbmZmNTNFSSt1cGZqZHZudXpCclQ1QzRD?=
 =?utf-8?B?cXJLTE52OE9WL0VxNFRnYnl0SVhxNytDZWVJVnlyakk2aWdPUllwVUo1TE1n?=
 =?utf-8?B?enc0cDZxYXAwRmlNcDNNV0dQSFBBUytZMnpKQkNDNmlTM0d5WUpheTRGTEU1?=
 =?utf-8?B?U0hYc1grU3l1cytMYXlMOWQwYU0vYWttam9tVGhlZ3hGa1RoQ05RN0NDaEZD?=
 =?utf-8?B?R0RPSlp2emF5Wk8vYVg0WXkwMFFEdFhYbmlJSWszRm55K0w4U0xMcGg4ZXlJ?=
 =?utf-8?B?RmJyclVRVTBaeG1GSERlR3JRdHJEWEpZcUdLNG4yV0dyVUUraXVxeGY0NU9a?=
 =?utf-8?B?ZDlaL3BDYUp1c0s5QXA3K0lBUnlyZVIzVyttdlJpN1NVRHViRG14M2NjRVYw?=
 =?utf-8?B?RzNoSE9rT2hIa3VtK2tRN2lseEpOVVZFRFA0VHYwdTNrc0FxSkl4WW10TlBX?=
 =?utf-8?B?WmpFOEVTUjY5NXFnQkVjSjROUkE2WGttK1VtZGg1MUU2YXh0YWt6SWovdkJo?=
 =?utf-8?B?Um5xQ3M1RFpvUG1CNXBuaXBBOFp2TUlYSG5ENG9UNGhkVmxqYzlXZnB5VkhP?=
 =?utf-8?B?TmFQSldFWnRHc0dOS0h5YjdKd3VyNWsyS2FKZGtQOUlQUHFWRTFLWUxGbUg5?=
 =?utf-8?B?bDNXQzdtMkwzS3lkcnNTUVdzZFBjNGE3cHZFbGxCVHg0N1BJMlVtaUd1NEhK?=
 =?utf-8?B?NldOcnJXbWNERGNrdEVNM2oxbWdpVm4yUDd4djRoWFp1WHpVWlBtcUl0VFZr?=
 =?utf-8?B?eGRlYVkzeHBDQkkza1BBQ3ZJdVZDNERzdG10a2pJTk1mcHpWcHJJc2NlSXNu?=
 =?utf-8?B?K1daeUgzeDJ2UC9aT3BLTVdZcXJvR25qU2c4QWVkQVVhajlsYStpR0dFVG1v?=
 =?utf-8?B?cXA3cW91cklGKzVITTFVVnBDVVhIMWlJcmpkdHBRdGFBSGV0UEhLZHFBbEJo?=
 =?utf-8?B?VXRsT3VTbWNkVGlQK1prNWlEZ3M0K0JQQ3haZ0JNdGdDVEpKejNSYkIwNldJ?=
 =?utf-8?Q?WKlcdgMmRRmtGUK?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be8957e3-5574-4e35-f1cb-08db66c5da36
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 19:40:15.8416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c60QxJYW+LHmAv62R6173dMO5Hue7yWJjGmAGlqdRyBc9INEeMaj+kfIgVnzVkiJyUq8Pkdp3x0IzZYJxHbaOhcC/ruRe7h/CkEDMVVj0Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8629
X-Proofpoint-ORIG-GUID: 0gpwAGA4j5kE81PlOdSIYc_sSeobFtY9
X-Proofpoint-GUID: 0gpwAGA4j5kE81PlOdSIYc_sSeobFtY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_14,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxlogscore=598 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306060167
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIzLTA2LTA2IGF0IDIxOjI0ICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBI
aSBSb2JlcnQsDQo+IA0KPiBPbiBUdWUsIEp1biAwNiwgMjAyMyBhdCAxMjoyNTo1OFBNIC0wNjAw
LCBSb2JlcnQgSGFuY29jayB3cm90ZToNCj4gPiBJbiB4aWljX3Byb2Nlc3MsIGl0IGlzIHBvc3Np
YmxlIHRoYXQgZXJyb3IgZXZlbnRzIHN1Y2ggYXMNCj4gPiBhcmJpdHJhdGlvbg0KPiA+IGxvc3Qg
b3IgVFggZXJyb3IgY2FuIGJlIHJhaXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIG90aGVyIGludGVy
cnVwdA0KPiA+IGZsYWdzDQo+ID4gc3VjaCBhcyBUWCBGSUZPIGVtcHR5IG9yIGJ1cyBub3QgYnVz
eS4gRXJyb3IgZXZlbnRzIHJlc3VsdCBpbiB0aGUNCj4gPiBjb250cm9sbGVyIGJlaW5nIHJlc2V0
IGFuZCB0aGUgZXJyb3IgcmV0dXJuZWQgdG8gdGhlIGNhbGxpbmcNCj4gPiByZXF1ZXN0LA0KPiA+
IGJ1dCB0aGUgZnVuY3Rpb24gY291bGQgcG90ZW50aWFsbHkgdHJ5IHRvIGtlZXAgaGFuZGxpbmcg
dGhlIG90aGVyDQo+ID4gZXZlbnRzLCBzdWNoIGFzIGJ5IHdyaXRpbmcgbW9yZSBtZXNzYWdlcyBp
bnRvIHRoZSBUWCBGSUZPLiBTaW5jZQ0KPiA+IHRoZQ0KPiA+IHRyYW5zYWN0aW9uIGhhcyBhbHJl
YWR5IGZhaWxlZCwgdGhpcyBpcyBub3QgaGVscGZ1bCBhbmQgd2lsbCBqdXN0DQo+ID4gY2F1c2UN
Cj4gPiBpc3N1ZXMuDQo+IA0KPiB3aGF0IGtpbmQgb2YgaXNzdWVzPw0KPiANCg0KVGhlIG9uZSBJ
IHJhbiBpbnRvIGlzIHdoYXQgSSBhbGx1ZGVkIHRvIGZ1cnRoZXIgZG93biwgd2hlcmUgdGhhdA0K
V0FSTl9PTiB3YXMgdHJpZ2dlcmluZyByZXBlYXRlZGx5LCB3aGljaCBlbmRlZCB1cCBmbG9vZGlu
ZyB0aGUga2VybmVsDQpsb2cgYW5kIGNhdXNpbmcgdGhlIGRldmljZSdzIHdhdGNoZG9nIHRpbWVy
IHRvIHRpbWVvdXQuIEknbSBub3Qgc3VyZQ0Kd2hhdCBvdGhlciBmb3JtcyBvZiBoYXZvYyBtaWdo
dCBlbnN1ZSwgb3RoZXIgdGhhbiAibm90aGluZyBnb29kIi4uDQoNCj4gPiBUaGlzIHByb2JsZW0g
aGFzIGJlZW4gcHJlc2VudCBldmVyIHNpbmNlOg0KPiA+IA0KPiA+IGNvbW1pdCA3Zjk5MDZiZDdm
NzIgKCJpMmM6IHhpaWM6IFNlcnZpY2UgYWxsIGludGVycnVwdHMgaW4gaXNyIikNCj4gPiANCj4g
PiB3aGljaCBhbGxvd2VkIG5vbi1lcnJvciBldmVudHMgdG8gYmUgaGFuZGxlZCBhZnRlciBlcnJv
cnMsIGJ1dA0KPiA+IGJlY2FtZQ0KPiA+IG1vcmUgb2J2aW91cyBhZnRlcjoNCj4gPiANCj4gPiBj
b21taXQgNzQzZTIyN2E4OTU5ICgiaTJjOiB4aWljOiBEZWZlciB4aWljX3dha2V1cCgpIGFuZA0K
PiA+IF9feGlpY19zdGFydF94ZmVyKCkgaW4geGlpY19wcm9jZXNzKCkiKQ0KPiA+IA0KPiA+IHdo
aWNoIHJld29ya2VkIHRoZSBjb2RlIHRvIGFkZCBhIFdBUk5fT04gd2hpY2ggdHJpZ2dlcnMgaWYg
Ym90aCB0aGUNCj4gPiB4ZmVyX21vcmUgYW5kIHdha2V1cF9yZXEgZmxhZ3Mgd2VyZSBzZXQsIHNp
bmNlIHRoaXMgY29tYmluYXRpb24gaXMNCj4gPiBub3Qgc3VwcG9zZWQgdG8gaGFwcGVuLCBidXQg
d2FzIG9jY3VycmluZyBpbiB0aGlzIHNjZW5hcmlvLg0KPiA+IA0KPiA+IFNraXAgZnVydGhlciBp
bnRlcnJ1cHQgaGFuZGxpbmcgYWZ0ZXIgZXJyb3IgZmxhZ3MgYXJlIGRldGVjdGVkIHRvDQo+ID4g
YXZvaWQNCj4gPiB0aGlzIHByb2JsZW0uDQo+ID4gDQo+ID4gRml4ZXM6IDdmOTkwNmJkN2Y3MiAo
ImkyYzogeGlpYzogU2VydmljZSBhbGwgaW50ZXJydXB0cyBpbiBpc3IiKQ0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJvYmVydCBIYW5jb2NrIDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0KPiANCj4g
cGxlYXNlIGFkZDoNCj4gDQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NC4zKw0K
PiANCg0KQ2FuIGFkZCBmb3IgYSB2MiAtIGFsdGhvdWdoIHdpdGggdGhlIEZpeGVzIHRhZyBpdCB3
b3VsZCBtb3N0IGxpa2VseSBiZQ0KcGlja2VkIHVwIGZvciBzdGFibGUgYW55d2F5Li4NCg0KPiA+
IC0tLQ0KPiA+IMKgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMgfCAyICsrDQo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+ID4gYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXhpaWMuYw0KPiA+IGluZGV4IDhhM2Q5ODE3Y2I0MS4uZWU2ZWRjOTYzZGVhIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jDQo+ID4gKysrIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy14aWljLmMNCj4gPiBAQCAtNzIxLDYgKzcyMSw4IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCB4aWljX3Byb2Nlc3MoaW50IGlycSwgdm9pZA0KPiA+ICpkZXZfaWQpDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdha2V1cF9yZXEgPSAxOw0K
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3YWtldXBfY29k
ZSA9IFNUQVRFX0VSUk9SOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRvbid0IHRyeSB0byBoYW5kbGUgb3RoZXIgZXZl
bnRzICovDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4gDQo+IHdo
eSBkb24ndCB3ZSBoYXZlIGdvdG8ncyBhZnRlciBldmVyeSBpcnEgZXZhbHVhdGlvbiBidXQgb25s
eQ0KPiBoZXJlPyBEbyB0aGUgaXNzdWVzIHlvdSBtZW50aW9uZWQgaGFwcGVuIG9sbnkgaW4gdGhp
cyBwYXJ0aWN1bGFyDQo+IGVycm9yIGNhc2U/DQo+IA0KDQpBcyBmYXIgYXMgSSBjYW4gdGVsbCwg
eWVzLiBGb3IgZXhhbXBsZSB5b3UgY291bGQgbGVnaXRpbWF0ZWx5IGhhdmUNClhJSUNfSU5UUl9U
WF9FTVBUWV9NQVNLIGFuZCBYSUlDX0lOVFJfQk5CX01BU0sgYm90aCBiZWluZyBoYW5kbGVkLiBU
aGUNCmVycm9yIGNhc2UgaXMgc3BlY2lhbCBhcyB3ZSBlbmQgdXAgcmVzZXR0aW5nIHRoZSBjb250
cm9sbGVyLCBzbyBpdA0KZG9lc24ndCBtYWtlIHNlbnNlIHRvIHRyeSB0byBjb250aW51ZSB3aXRo
IHRoZSByZXN0IG9mIHRoZSB0cmFuc2FjdGlvbg0Kd2hpbGUgYWxzbyBjb21wbGV0aW5nIGl0IHdp
dGggYW4gZXJyb3IuDQoNCj4gVGhhbmtzLA0KPiBBbmRpDQo+IA0KPiA+IMKgwqDCoMKgwqAgfQ0K
PiA+IMKgwqDCoMKgwqAgaWYgKHBlbmQgJiBYSUlDX0lOVFJfUlhfRlVMTF9NQVNLKSB7DQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogUmVjZWl2ZSByZWdpc3Rlci9GSUZPIGlzIGZ1
bGwgKi8NCj4gPiAtLQ0KPiA+IDIuNDAuMQ0KPiA+IA0KDQotLSANClJvYmVydCBIYW5jb2NrIDxy
b2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPg0K
