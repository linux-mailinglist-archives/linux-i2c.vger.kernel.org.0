Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B09C6F41D4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 May 2023 12:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbjEBKhk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 May 2023 06:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbjEBKgr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 May 2023 06:36:47 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2122.outbound.protection.outlook.com [40.107.8.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7511455B6;
        Tue,  2 May 2023 03:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifu7PVk4VVjVSXRUt8s5o0zoE0Uhj+qQpXJ6ER+Ff1WVGUDW6K8aOAgU3bndhcv2pPGBv4xc9AmLXmrt2FW4AH+Fa7JetHk35iZq6Q/qIm+HCb+gvF68xRka14RQkb/WgJL8XrYT+EUSp3P/B8fw9c288SGg4uKFvSkB5AB0v59OJcKARi5U5tFubBINad28SXY3iobWb97FbB/QjFgHuSKW7Bvezox7UrBleNC2wkm7tAzHVdDSvZnWRD5UadJoPwo7fW5D4W6orP7S0fqSfapxBw//YSrSI1Bmd6oSZVrw7NZ0iKcKFs/+AJZ8J/uxsEJT2VJyu2PSHgNfnLVuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/57qbx/4/a2zAc/Xi/ATAu+rxBmF4JUryYQSmzWz0i0=;
 b=hox49NHYSKdnAqDxMbafUWHXTjWFOOFv8sqVE77dmELDu48SRJYsiuBeICqNMJcu6NtewbaJZChEjsR8vE0tcGHoRk8QSuMuyWv5uhd1mIuicipeQo3E1YSYwi7hcey7bo0y6szOrIB5csYirGdeZA8K88PAzWBrONpEXiGcZZSbUzKmEjmd1eLwHu/YH+FZZ3EXEDf5acE9I+NXsKWMWZmOMdlLgMA6LKIF1vz0CqMZULR5JGYJ/i1/RAhfZL0dSq5MWJpPVaNYLxWxkEzza+5rDHPJU1vhY2G6Sz7F3de1BMaEmJLe4YMWhKF/NHcDOHaffl1MEbkfu6PVd/9XjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/57qbx/4/a2zAc/Xi/ATAu+rxBmF4JUryYQSmzWz0i0=;
 b=OQLxIMfLrYuqAXRodkWrDjz3zKDloGQgy/OKN5css2ciYQSlODxMfx7XHIeMfsSh+NDsO/gtdO6W+eTC0jbPkVYNLdlDgYrSAJuXQSLztvWDye0GsrGrLsWC8Dvg3w4PTFhtquTyKQ7LXxyGHLbcqU5aIy5T1IjGskJ2zl7I4bM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAWPR02MB10067.eurprd02.prod.outlook.com (2603:10a6:102:35b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 10:36:32 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::3d67:4b0:82d5:1daa%5]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 10:36:31 +0000
Message-ID: <cbaf1816-ffd1-686d-9651-605da29d76c6@axentia.se>
Date:   Tue, 2 May 2023 12:36:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v14 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x
 variants
Content-Language: sv-SE, en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230501091552.847240-1-patrick.rudolph@9elements.com>
 <20230501091552.847240-3-patrick.rudolph@9elements.com>
 <fd20cad6-34f9-5f3c-abe7-cdf3a93d712c@axentia.se>
 <CALNFmy1gxUD-C62SH5GxA=fq8eKYxiOHe8wqXGsVdzsyiJc6Xg@mail.gmail.com>
 <cfb17cbc-b8cf-c3ce-cf77-7e13e12c42eb@linaro.org>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <cfb17cbc-b8cf-c3ce-cf77-7e13e12c42eb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0026.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::25) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAWPR02MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3df324-1218-423d-5c97-08db4af91824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhRsAtat/rjelrZAiYYpU4m8VfXjuOKMrVLqZF0HUVk+KigRwRaXAm57JfUMZDEy7lZCL992o+jcp56iTInZku6H2b19Bb9t2Myi3Dm36EJS6OTMOzlFwiXVrCSwpPjEEafGXZSp73/VrADydxrROwW4qpDT+zuZeqlDpWn9E9e/brNzHdt5u4lxZy+LgZLuhoEETp5BEYQDbd8s/hLPPnoABU8usUZzZvXltdeXyx7Q4LGt21U7JScbrSVY8ocJOpUBL4Ds6ZUzBL7O3tVljhAQe4i4KaVJIKpXccjTle2P62Mkc7QagwmscplYFvFCMB45jA/wldxYd/001VWZdXfvhzsaKHckFvH1Xz2/iGqS0NGL61xRBqUzoBIU5fThpPBbQYcPnwImK6r6FsX72zk+SoU5bmZh+OGe8HOmbYn8z6HuRWezYCPffnnZrPCQ7/za46k39wc+GIvZ5O5gn51C+ZxDysXFhT3zQkm9YZ7GFp5oZWz7dsELFVDW/aeCfnuw/3U4KYPziL87Hx8quV+V4c254DMgUbv7SMWIUx6CJvsX6bIsF0/29Mbw0ZC1hdkBU8bSvlhnFsKb5cvSJNMIKV2kDZqTIci8tWAxK39z/5QSX4eBXeKPJo8b7xVhL5llE4MwcIpuij45DJEs3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39840400004)(136003)(396003)(346002)(366004)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(53546011)(6486002)(966005)(186003)(2616005)(6512007)(6506007)(26005)(110136005)(4326008)(478600001)(66946007)(316002)(54906003)(66476007)(41300700001)(38100700002)(5660300002)(8676002)(8936002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjZsR1NOV052dXRYbzA1NVRZSm1TMXpsaFB3ZnB0ZlNvcStvbnJIOGplZlNQ?=
 =?utf-8?B?cFVZN1loNElwNzFDYk8xaFNwdjljM29XMkNoZk5WM0UwOGtiaGx6K0tRZHpN?=
 =?utf-8?B?cnNLUjdGTENrc3RuZmRVSGRQeDJtd1ZOQmYzU2xaZGlCaGtnNHh5NFFjV1lk?=
 =?utf-8?B?dklRQ0xCNWRNcFdLRjllSkNVQWxFY0dlTXpRRnZ6WFhBUWc2ODhSdkExRGFU?=
 =?utf-8?B?TUh5U3VpemJYelNhNmd6Yk90WHdtYXpodkczSDlSWGQ3elhabmJFQnh4Wm1D?=
 =?utf-8?B?a0lVSjU5VitUVUZlWlBjdHQ3aERvSXlYU1RBZWttMnRvMnRvVEE2Q0FEWGht?=
 =?utf-8?B?dSswNmZVTVdpZlF4ZTZZVFRSVUIvakxBSVQ0R01IM1B4QmtOVjk4S2UxMEY5?=
 =?utf-8?B?ckRUU2ZWNWlFNHJnc3pCYUp6RzF3alRiMVZKeG5pWGN6Z09zSExLVlZuQTJL?=
 =?utf-8?B?QXlMbzBGd0gzZGdldEw1b2ZFcXpxWTFQTDhha2RNYkpHTTRNWGRnWDhQZEJu?=
 =?utf-8?B?VFkyVGtmbEhyZzB6ZENJbUl0c1NJVU44bHJaYklBUmIvVVNENHNYeTQvNHZB?=
 =?utf-8?B?Qk9iKy9rQlpha2RaVWpHaURtWHA2Rm8xRGllL1FaNFdnTlNFaTlIUEQ3K0tr?=
 =?utf-8?B?YnBFVkVTMTNoOHRIeWpuTVRwQlZUcDliM05FMjBOWVlLQ2dmak5TZlNNWmdR?=
 =?utf-8?B?VXdEK2hndDRoQlkyakw2K1liYkNQeHRpUTFHRjN4S2NScnhjZGZ0ZkJiOERF?=
 =?utf-8?B?NmJpRmJldmFCbHByeTkyVXVFTUwwb0dVR1NWTVhyOUs3WDJyZXpDK2JOc2Ni?=
 =?utf-8?B?b1RuWXZVU05ObnRyb1VFMWNDR0x3dUFLVGFENUUwa3JBcGJ3MUpUcGhWNkdE?=
 =?utf-8?B?b1VGR0ZoTXFvWC9yZUViRGdWYXk5NmlxY0tvMDdHVEFxUEd0NUNMK2I1aE5k?=
 =?utf-8?B?RHdHWW9qK1hLbVdGMmlHQzc1djJqeHdoNittTHNidGh3N1ZGdGtLZFhjY3lV?=
 =?utf-8?B?dzdESzdQdE5uN0pCT2dWV3EwV2VnZGFkUmFoMkN5NGZxY1ZZRTBPdmZBR3l0?=
 =?utf-8?B?dU5BMFhlN2JQeU43alF4NGQ3d1I3c0RUWFNWWXJjd2JYa0ZkZHY3Zm1BWFYr?=
 =?utf-8?B?S3pldWo4SHZxZFR4dUxud0pxeEVrcnRkVUFuRDc5RW1NQ0ZqZHFRdkw1ak56?=
 =?utf-8?B?UWlNOTUvb3pYd2RxK0l5WlNTYlhleGxKQW5keDBkMGVXT0huYUM0Q0h0SzNp?=
 =?utf-8?B?OTNvYlVPbkhTdThrb3lBQjdiMXBldnhwL243M09GSndoL2lucXVhc045bkpP?=
 =?utf-8?B?cVMyYUR5SENNM3FzWk1HcDBnZ2xraEhrY25vZm1DclNPQ1dNdGpjQ3JaMFN5?=
 =?utf-8?B?MzEyY0x1NG9CczVYcWhXRWhkODdyVW9zbFZjeSthTmVWRTBhSGFYTmVTbzFQ?=
 =?utf-8?B?UVV4dmJITjJTYllVVzI4d0tHSGF2ZWVtWStNR3VxUDhVZzZqcUcxVUkzMFYy?=
 =?utf-8?B?dWxyRlY5bklGK21BQy9LbDZLV0xRc0xNQ1MrVlBBMS91a2dLUzZkSlF5dlhN?=
 =?utf-8?B?SlNrZUxVNldQQVRoUFVzZllueFM0MzJtRHZaS0QvRnJ6dHZhSGduYUFDOFc1?=
 =?utf-8?B?eG05eXlkb0NvekVlZFEwUmdEUGNvK1VLS0U3TkZzVmo1Mkk3MmRJOVpUY1Zk?=
 =?utf-8?B?VWNkNnJ6amE1TXg5VXRmYkJ3ckEzcWxLWjZTbXlwdFo5bVN6Wk5Fb2VlVUd6?=
 =?utf-8?B?NGxtTUhJWDViYlVIclB6QS83UlZXQ0pUOUxpTkI5TWszMjJxOWtVNk53NUZu?=
 =?utf-8?B?QnlpTnpOdVBTMzJKb2tjRWExSUZNU2JPelNLR0FqNWhHOGV4dUxLQzZOZVlK?=
 =?utf-8?B?RzZ6Y3A5bTlnQmc3RFc5ZHVEeE5qYXV5ZlJ0N2ppalg3bE84OFFQYWlnemJN?=
 =?utf-8?B?UUpoRmxseVV0d2ZkMnppNWloQlBpMFROaEdGQ0hSQndYRGk2bG9ncEs2dTQ0?=
 =?utf-8?B?c0RPRnBNWGR3U3BPL21WYjJyd1RMWVk3UmtEU05YNEhNSTRMMUMrR1BoenpM?=
 =?utf-8?B?ZEFBZEJhV0taa3ZIbWtLL2doNzNMeGVYZ1dRNU84YmJKaGt2cDBMcE9jcnA5?=
 =?utf-8?Q?t8MMx3/62Ad6tvhMCKxiit+qw?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3df324-1218-423d-5c97-08db4af91824
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 10:36:31.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mhj0ivvLJnzSipG1z0u3zG8nSCMdE4YD+ESiQ67ejzDW5awhTKiuW2y2FiaQaGL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB10067
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-05-02 at 10:46, Krzysztof Kozlowski wrote:
> On 02/05/2023 08:52, Patrick Rudolph wrote:
>> Hi Peter,
>> it could indeed cause problems when VDD1 != VDD2 and at both needs to
>> be enabled.
>> The pca9846 datasheet seems to refer to VDD1 as VDD. Thus I could add
>> an optional "vdd2" regulator to the binding and driver.
>>
>> Please let me know if that's what you had in mind.
> 
> Don't top post.
> 
> In such case vdd-supply should not be used for VDD2.

When reading the data sheet [1], I get the feeling that the instances
of VDD are either copy-paste errors from data sheets from chip with a
single VDD, or a reference to either of VDD1 or VDD2. It is thus not
super clear to me that VDD should be the same thing as VDD1.

Sure, there is section 6.5 "Power-on reset", which mentions VDD and
VDD2 (but not VDD1), but that seems like a simply typo and that it
should really have been VDD1 instead of an unqualified VDD.

There are also various timings "glitch supply voltage difference"
(delta VDD(gl)) and "supply voltage glitch pulse width" (t w(gl)VDD)
with notes that refer to VDD2, which *could* indicate that the
glitch in VDD is about a glitch VDD1. But it could also mean glitches
on any of VDD1 and VDD2?

The general description of the chip indicates that VDD1 is there
mainly to allow different bus voltages on each of the channels.
Which is not at all the function of VDD on the other chips. Meanwhile
VDD2 "is the core logic supply from which most of the PCA9846
circuitry runs", and seems like it is a better match for plain VDD?

Maybe one can find out more by reading the spec more carefully, but
as I said, it is not clear to me that either of VDD1 or VDD2 can be
matched to VDD.

Perhaps it is best to not mix things at all?

[1] https://www.nxp.com/docs/en/data-sheet/PCA9846.pdf
