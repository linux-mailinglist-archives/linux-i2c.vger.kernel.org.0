Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5377A79272F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbjIEQTr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354039AbjIEJZZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 05:25:25 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEEF127;
        Tue,  5 Sep 2023 02:25:22 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3853OSbj018296;
        Tue, 5 Sep 2023 09:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=hQIMTIiqx8kDDcmWfUGG930unu8apKf/BxwjF0aZq+M=;
 b=NC6hti9CFNedEW/S45js1H6DjnEJ2pMZseN0KW8Xz/kte+vTmrPD9eNbOnUwOupFwxsK
 uCZpXUoR7xYXUeD/+yGOxXF6F6Auv6i4bI3V76sJDWLUiPeuI+dwYPOgMT6Tml+MvbHS
 jQQxyPBChVbwiL42W7kDreEdlwJEkpt+REpBw6PxkZZXpvXCWgYwD7IUq8oMT+jXcWSI
 3WAIhoDhrM9QdeWtsNCVFxsetIHQm81VrmLAGWmrbuEoIg5YllbrWASIur3C8ypLX/Xc
 Asg8afSRSsxZlq5OsaK9av4Vmt4r3hAsSFpc5e1QMXmwf/w81hiy8ye+0KWRfEh7f1Cd Ig== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3suun1mx3v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Sep 2023 09:25:00 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3857VgcQ029059;
        Tue, 5 Sep 2023 09:24:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3suug4gmcj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 05 Sep 2023 09:24:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3qnPKgx9Srs20pEp2kEVjzbsmoc5WD+kHuo1wPh3XoISV+Wm3HlDON/ivqCvnlvhRippFejHSE04kMw3sUHwnjm0rCA2l4EtVTC3/YD8Z20vmNQCpysRFPYFtCnqMtHS5g5gJljxssDKmMHEJ2O9BDwKytBBt40QeLO4jXl78iToP1I8Z21WkNpa1g9J45TXd3vt9sJV8JAgBnc0TsvFtZoAdfubL/241pe7trOs5Gz+5b9A/21TWij5d5mZL3FPgoHr/DdCSdXm0P1KFywgBIp3KWqhQBYQAdlXRfkul5MM9C61weRr+Gua7SOEnR7ntYU4P4MNnFkKie2p5r7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQIMTIiqx8kDDcmWfUGG930unu8apKf/BxwjF0aZq+M=;
 b=JW7PMrylwAoy6hA3dm43wC7N7lT3tNf3SFeP40Fi4YVMIcxw//VVNfxemYOH08XvHJZvzN10f2wsemfOZAvvOreEYhC3iiQI33jtbbdicyvQZqzWYm70Zy/b3+esqvfi236qHAtxkE1nw6Jv/i3jKA0q13slU3ywcusWlm8RrOnc0lRY8iN0hr8NyOmGEW4Dvcm+B284pmFrz+616+MSxpD5kXgU20Jwj62wJANpoeqy++5t0hRV34ha0YfNIHpomMBbdSjXrPvKQDZ3vzcG1uh+PUd7vg76V0D30z6RD+h/mSNRdG8+BQ5eswa9UKBTjHkjgDa44oydcKc57sDeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQIMTIiqx8kDDcmWfUGG930unu8apKf/BxwjF0aZq+M=;
 b=y/YMgKP+g/vEz5mY6wuD6mCuzTmhgQ3KvEQrD447r3jMISELI7p4FN+O7v17DebTTmVoEf3CZFlx4EaT7hBzw9aBjjPzJvrTUlERw7HRXcMV0YDZ6u+YlYapQ/l63EWPZ+B3vSm5bjBoFdBii0w3W+qc6PdxdgvTVLkXb6jD/jE=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by SA2PR10MB4745.namprd10.prod.outlook.com (2603:10b6:806:11b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 09:24:57 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::3ec2:5bfc:fb8e:3ff4]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::3ec2:5bfc:fb8e:3ff4%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:24:57 +0000
Message-ID: <92e480f9-8753-4bb1-f574-9bccd5d28021@oracle.com>
Date:   Tue, 5 Sep 2023 14:54:45 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH next] i2c: qcom-cci: Fix error checking in cci_probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com
References: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
 <47e3acac-7d4f-43bd-bd55-5ae9ab993f2d@kadam.mountain>
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <47e3acac-7d4f-43bd-bd55-5ae9ab993f2d@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0208.apcprd04.prod.outlook.com
 (2603:1096:4:187::10) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|SA2PR10MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: c4eec2cf-0f2c-441c-a4f5-08dbadf1f85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkZ9SCqLtw0P7G+h0gRowihlgTCXIpkmYPAenaZZB9rGPfOg0gSH9tqjTiSf0o2v95t4YXrvFGI3vP7FCTS+s+LpATeLocJfrkNqDe4LDu+97ACiGL7LBhruvWZF7mI8apGYAv8lOSGKnr5SL68czBJq4Hd0/SX/r0YgW1FdWnBGJwfYEGBU1hHZd48CPyzU2aD+l0E84zEfrdooa37nvRyel7H/yi3w/NMBTXkbZJbRcJo/xRi4PL7soZjVhR5gWAsRhevTQk3yFMKj6Qu7bJyVsb1VRmlijglfcB3Fgsg4tlo35ghm6XF6hz3kCw3bJRCT0Zw+Enh2dlFqaa+qUXeDQ2axg6MyIs8vBIaOEAHrWvJAX1pXuo05q95Kuk/+IvaHVjF02LlT2TJQ/T7ukfZ7Wa38Np9oarxAZHiJOXfUaiDCP0qAWCTLX4WrAyepg6ckqewrT49LTQ5/2w2yOlJ/bxNM+I/aVVjfHDlmP3k4xm/UYecPqMjyStLtbrgzzAAVg40ljWT6Qef94zjUjKSYlvwoFO5+ycpFCutij8LRlr9jF2KlfA1V1dvMstcAl2kxW9XSVuw5HrKxMwTSZHBrb/t6MmamsrMVqDTncKYen9hZjrWa1jQU55EwzDti+sBIY48sDRgegBHv7Hh59A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(84040400005)(186009)(451199024)(1800799009)(6512007)(107886003)(5660300002)(4326008)(8936002)(8676002)(26005)(6666004)(6486002)(53546011)(6506007)(2616005)(31686004)(83380400001)(478600001)(6916009)(66476007)(316002)(54906003)(66946007)(41300700001)(66556008)(86362001)(36756003)(31696002)(2906002)(966005)(38100700002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjlNbFpIeHlXbGErbVVWWURuYXJpOVYyU3NhanBhTFVIOW9oNXpITWc0Tmpo?=
 =?utf-8?B?b0Fkc1NrWm5rbGFSRHZ1VGxmK0RLa3FGVEsxcFdYZXRRSlRUaFMxOElDSE5B?=
 =?utf-8?B?TE4xUGxRVHBZZmdBTEZ1U0xLTkE5Y2E0SERuMFdlTkdCMS9pdjJHNjVYc0sy?=
 =?utf-8?B?eWU2cVVBd3V0NVMzMDAxT2RkLzM0STVsY3hJNDRrWU9xTjdpQjdocDQ0eG5r?=
 =?utf-8?B?ak5DSFFkeDI2SE5RNGdCeDdmUC9wUFhmaHRkc2lVcm95VkRRMHdIbksxREFx?=
 =?utf-8?B?bEdLUG1VWTlpaTJsWHVoQ3BWSmZLb2ZNblJmVVJzL0ZZOWErV2RyRVlESEQ4?=
 =?utf-8?B?ZDYzdjJxcTF1SjcydzZxemR6MnhaOXRTaW0ybVdtcXl6dmtwTnVtVEhDQlhn?=
 =?utf-8?B?SjYyNC9RMktVRlBIeE02VmQ3YU1KM2t2NUg2Zit6b1NzenZzNXNIcmgvS3oz?=
 =?utf-8?B?VU5ZMFRMMWFxbDE5L091VktSS1hwdW1IVGd5MWxRUVFOQm9uOUNjQTd2NXB2?=
 =?utf-8?B?d3QrWUhseGIzN2pSSEQ1bThIODhMRVNFVnZtTUcxdEU5ZVNqZ0VtSXNhZkxh?=
 =?utf-8?B?SnB5K0xQTVVNM1V2TkdRR2o1dURqaVh0V0lrWVBaS1ZjNnJXaWwwMHlteVJ2?=
 =?utf-8?B?eTU0RUxGMFhWSVd4WVJYeXlheHhkU3c5aXhURCtSZ2tscDRLTXpFbUJXVWpF?=
 =?utf-8?B?MndRcENIdHN4NjNMRWpZVEVHbmc3RVBEcGNtc2YrNHhGQXBFMmI4UFBMZkpi?=
 =?utf-8?B?V3c1Tlprb3FUbllHK2tYaDJ5WjV0Wkdsc0xMWU1CLy9RcXFIU0JJSk10TWJ1?=
 =?utf-8?B?TitQK0hHTFlMcnV6T0hScGU3R3pqeWN2Z1M0ZnlzVlBXOFo5b1kwZFlVOWdt?=
 =?utf-8?B?RHg2YXRBS00rMjcxM2psYURBNEhDNFY2U29EUkx1WmVBR09lOExBMzNZOXc4?=
 =?utf-8?B?TFNzaDBCTDZHdHFqZkIzK3lwdkp4RGx2UWM0QkNoc0tnZlpveklXZHpUM2xR?=
 =?utf-8?B?bzU4dlpWOEFudUdYWS9NZmtRZ3liRGR5UVBMM25Yd3ozRTQvNWtPTEVGSCtB?=
 =?utf-8?B?MDJ1S2dSaHJnaWlXMk10eXBBclJQWnVUU0dGNzRpNG1oQ3BNK0s5WUt6RlVY?=
 =?utf-8?B?cGNKb3l0dWoyOFVsUVlOeFpxL2VGcFgxaXNTSHNrcjlaZ3dkYi9DcGxrVUJ0?=
 =?utf-8?B?alI2Qi9rV1JOV056Yk0vczNyclZhbHVhM2JFM3BBU1BIeWRZMjIxZEVIWVo2?=
 =?utf-8?B?LzJIUEZ2YkRtNWhZaGhOM3BVcjl5QmFPRWFsWDRUdlkvcWZRMWMwd0svUG5z?=
 =?utf-8?B?dE4wT2pQeXNSdnc0VnFGejJzb2UyQUpjcm5lUVo1NDFybXlSRU5wYjNwek5s?=
 =?utf-8?B?Sk8zYjg2RytSK3V4dytac2FYY2VKcTZYR1IwRnhiY2JBY1VFOGhjejBMLzRm?=
 =?utf-8?B?eVRtZTNuTXZEQWVhUGxhVXJXNGkzTFNvM1p3V1pnUnFiOGdiNkxQd1RCR3h2?=
 =?utf-8?B?WVhnU1J4S0dZeXg1SUFHU3dKOXl0dmh2Zm1DYUZwVlk4ZTJGTjMweTJpU0dz?=
 =?utf-8?B?RmhJdjNWejV0Q2pDUDZScElCVDlaNmNqUGQyK2JHSmJtbi9JUk56d0YycjVM?=
 =?utf-8?B?djNCSFVGMTRETzdwdDQ5cnU4aHQ5NjFwa0toNjhHN2dwTVZGQlFjc2w3cVRN?=
 =?utf-8?B?bjljNE8zZWVpRGM1ZHhmMFdnYUlCM1h0U0RSTXdzaEdvbmIyWDBvRHBhRjVN?=
 =?utf-8?B?bHN1MzFUUElJNnhYeDlDV2pOY01pQWFnVXpWUlQrZU4wYmowRVhIT1dBU0Vz?=
 =?utf-8?B?bEFQNUk2STg0TDJBeHRaRWlMdS9xdElha3N5dERGOG1XdzYySHdwTGM3UlhE?=
 =?utf-8?B?Zm5GNE1lcENJeUM0SE1qMDM4disvTWxjV3U4YWYzL0xNdDFzZ1RkM2E3Zkkz?=
 =?utf-8?B?anN6TWQyTVVyRUU1VEhxSTR0czhYWERtZlk3MXJGdFQ0YTlsdFBPeElHVlV3?=
 =?utf-8?B?NzB0Z3VISnZhaWc0QnVVZGFyMmFiclRobEdSVUh5WExFTEt1T1RsYVp0a2NW?=
 =?utf-8?B?T3Zqd2VIUG5BL0E5WUNlSHJsYXM5NEk5eFF6VjlOeFJmazRPZWQzbGVvYWg3?=
 =?utf-8?B?S1BDSTE1NnFveWVId3JjZ0RUcGUvNTcxTzNFS3pIOUdMSUtZYnRYb2dlblhK?=
 =?utf-8?Q?rC4R2xC06J/mUbsSy4PAHbU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FTDyoAv7+wSwUOsUE5aGJAW1uEDOOgFSXy2o8U8MDT3Usr2GsLeHx43xVt2tX6fUcgu+cJJQqAPqS1c9+LB3fAklZxAuCcwU1j7YylH1OZWoTA/PLXApxYik+K4kk0X44zBekijp0T/gi/hi9HtW3BWLcdjGadvUmMuh+KmlmVuusTUcU57B5mKdBppRrb1Y8jwfXpTr1vn/0PEQnhGQHuDTbewKsrKgkWpChd+SCKrO9paJywm1ig4J/PBQ8hg9ZZC9oIkq/Qs4G79Qpn7PgwPb1O3yAw4KIzCbQFQvhIl/3x5kqeV8gODBOlxhVQbqIApVKfictcCCY+xbF2oduSoGsKu8aWlQSJFobZgAkajykTATp2oiLMkx9qEiLkAE5jVaFGIHgRDfT4pfzPXu1q3YkCJQZfOK6dY0h9GU3AQUkfhlWr9ljInjccSVfcPN574ytraV8l6DBvP/fCEWDhn9FvROuwFSTwOFU9zGVSJdzCQU5ZvSX73hn11Edx7ZmYTffFgtso9/ZLdeBwJ7f4e1VB2+fnXFr18ObPmOrbwqnBB6aBOCZ7QirKxJt2L0ODgAzlcRpTyjBMBUEcXTdZ6a7e6lsQfp1XXIH0wrBKkxTF8pO+K7qJu4usXTwtWoyXADFetnr9MXWBzhLMU6cOmLiTl7JOpsi0ZDPp1y0OrMfenFo7YQ3eKeaDQrmvuehrAuc5G7YDCXlcmpawdmu3I41W1m1dBXaq+R6CqDGULUn8UUyxNB7j2gBhyqJblA5hrzMupwghkKcb22XkaAVzF/sWxdA8ZCMCiZZ99DCmG05ahb2wzZ7LEnBeOxhM62OCqQ7/FFyWP6Qk16REnABs117+UnEb7+jz6ktZgAJMXKV0zX2uV6r7fMAlHaEV4L
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4eec2cf-0f2c-441c-a4f5-08dbadf1f85c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 09:24:57.1612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gd+9CK0AdJg9Z8p9/KLx7QN4otD+LELf7t1r8wx8tKm0qBJk1IygSgq1UsyRCf5JHf5sHgQWraV4ZX199QLWZlq8andSeyCqYRjfiYpcO+TT7763Pzg31b29Sgh7UcKc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4745
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_07,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309050084
X-Proofpoint-ORIG-GUID: uaGQPQHxGOEaiX15XtfNmqak-f0KGA3V
X-Proofpoint-GUID: uaGQPQHxGOEaiX15XtfNmqak-f0KGA3V
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 05/09/23 2:40 pm, Dan Carpenter wrote:
> On Wed, Aug 23, 2023 at 12:42:02PM -0700, Harshit Mogalapalli wrote:
>> devm_clk_bulk_get_all() can return zero when no clocks are obtained.
>> Passing zero to dev_err_probe() is a success which is incorrect.
>>
>> Fixes: 605efbf43813 ("i2c: qcom-cci: Use dev_err_probe in probe function")
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> ---
>> Only compile tested, found by static analysis with smatch.
>>
>> https://lore.kernel.org/all/CAA8EJprTOjbOy7N5+8NiJaNNhK+_btdUUFcpHKPkMuCZj5umMA@mail.gmail.com/
>> ^^ I reported initially here, Dmitry suggested we need to fix it in a
>> different patch.
>>
>> the Fixes commit used above pointed this bug, but the real fixes tag is this:
>> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> 
> This has already been applied but, for future reference, you should have
> gone with the real fixes tag instead of where the static checker started
> complaining.
> 

Thank you for sharing this.
Will use the real fixes from next time.

Regards,
Harshit

> regards,
> dan carpenter
> 
