Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A309B66DCAD
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 12:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236386AbjAQLkW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 06:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236400AbjAQLkQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 06:40:16 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C992ED6F
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 03:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD9kFnVW3zKiiJz0VrYgR6FeOgMbHYqtP0+CLapJDnFi8Ql6pKyOf1x1ORN6kCvl95on8klaXuNxtQPuUarbqOhXOQEaVdL0xmx45I1QAhx9ZXhYlBMJLYeYW4+PXzBpfsXcjI26EJqQBaRTnKA8xhuGlXwN8Ng0mctnN1gst78uv3NafYIRboylU3YdfBX37TdLX3oxzJS+MHD5hJaxCumsIus9NO+fBxND+rIORfcFYnvPJYF1wcxVo5jaCsdnR2VLjrFQ7Pn7jjyII2mG8B8VNYwy8GxuUe+voBXiumnEaWt3WUTD9RR5gxHDk/PH2Y9+3OMGn5IYgALYFK1Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uDvkmI/YiR7qrpYjpefy06M8JgvhDu1TbU5Dj+DeXI=;
 b=FOBkMWaa+738067zWiB5inOjBel+biy85wuu4TpURLYt5CRfx3IfPSYmhGBaVO/EKJpW2EacX5YGttjSBztpCbsFdNzXfHl1/62QoKsvvbHSTrvDx7Zt3zWD2aYoFGODAgMiXilatSR90Wf8/VY4fmPaGaCR55e83nBnuiw2aSKqUvq9gUDTdpmQn5wIqELK9hpdarVkhKQwEhhdq85H1PIxQC2LSBLQWFx5rV7hfhWKnFYd/gcNvPMIKW4jqicD69CBCh39/5xbElS4QNbCzDIxu9kGeUbXCVRnuuFDpAW/de+zqS7eV0o4NIcAzENOSSLNl4J3+a09cV04HhQK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uDvkmI/YiR7qrpYjpefy06M8JgvhDu1TbU5Dj+DeXI=;
 b=A6ZXsdEvQsZHQed8DCKwGWEjqurmHiukbKprgIkFxJ0AnV4V+Mglgl/dLaGkxh+YrIVq2OMVgJu70rZ2TS8O8QRpwTGYn19RYDQplpUVlV50UiwRzfbFLd6y4f9mlAMuFLKqNUpGfYVKhz0za4dzCZINtQMTyOz4qv1oqLeQM1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 11:40:04 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 11:40:04 +0000
Message-ID: <e3b96866-9bb0-93c6-26ed-5c2bece7570d@amd.com>
Date:   Tue, 17 Jan 2023 17:09:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] i2c: designware: add a new bit check for IC_CON control
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
 <59fbf54d-9bbc-efaa-bb2a-74880156e310@linux.intel.com>
 <fda9b261-0b42-1c13-b40c-8ad93088cbf2@amd.com>
 <Y8Z6n7HEXBQx6Nxg@smile.fi.intel.com>
 <2e640cb9-476e-6d3c-97c8-5500f59eb5e3@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2e640cb9-476e-6d3c-97c8-5500f59eb5e3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: c3883aee-5140-4c53-ff4d-08daf87f937a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wu/db97O0NVvgglaoo2YHU3RCSfU2D6URiENgrZol/pLSqwY0l19WCUoTth+bkN+EOMXTsqTzjq7kyrZBO4Dc9K1kALq/b6on+1OxXakGoRiXzlCq7/oWXUunl2RxwTSkyBPMWBwTIlKFfVchPA1yAdWbRF7osNGYgy6Mc1qCEDgj2rQrjPyjlWNnXe+x7BZi88KFC5XORchz2Mxzx4olGpdoHYFkDGdjW8wZqm8AYBXxuEv2ftxrmDVkGAYazRzbUlbYxkjWjNM870XHAF1CR3gLkOCGxA6tHzmc7vmtI+U7GdoUU8jIfvdCA1K4Q+zCfWBakUpv4VD1IUWwFyqbB1FRTbli3l9J3wJpDX5r/LL7Ehbmt19duT0B+OD8piLm38U+Oc2quwubDDfbI/y+d5Q/iLGfn++tA9l5DFQ9Clln/1hYxqRBnuCJNEHFYN3vs1BE+sjSbWCIEc3euYjymcaxC3jRyO2ymv2JoEqD1N/B5UAt7GW2GLCsdhh0Ezuaor/BJ2reiXwaVJSbao4Vq90uXxAIV9ixv/n7slNeOk09p5Z7VGTQkP9MacbmTfXtH4ukEtRSjet4/8g3ZmVR4sSISXDQsZNlJ/fSlLI315G79x7kgI2RSvV3Ky35PX8MxkBfq30Mt+TPDfz5z/BFFZLH78akl7D499wrLcnc8Dq8Es+4Xoeq9YQoO3yA8PgsTukDs7IxTfal16xE5pD4LpL+441eZMMPYKVgHTLN3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(66899015)(6666004)(8676002)(66556008)(66476007)(66946007)(41300700001)(4326008)(8936002)(31686004)(316002)(478600001)(54906003)(2616005)(36756003)(110136005)(2906002)(5660300002)(6486002)(186003)(6512007)(31696002)(53546011)(6506007)(86362001)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVZhdStmVDJiV1FNWDU0bFVmdnBYRXVSL2dJRFZnTnFLSHpMT0ZQcFlDMnV3?=
 =?utf-8?B?R3A2SHJ5bWg1TXdKU2JnK2pXZGxqRW9nWnBnbkl6MjgvU2NidW5LcnVLVW5V?=
 =?utf-8?B?eklLb3VuOWphT20yRENrUk95OTArS0FPV3ppcjd0TzY2WW1VK1NwSFlHbEpl?=
 =?utf-8?B?d0R3eDd6VE1JVkVEendsbC9walV5bnd5UEFRbGhLUTRyN0p1N1Mxd2NVeEor?=
 =?utf-8?B?NHFDT0o0akl0aU8xN1NvNjIxZGtEQ1dHTWdDdUZmV1JhZW10b0RQWjlTaEll?=
 =?utf-8?B?SndxM05LbWVjNWhKNGYyZ1hFWmNCVDhNNjJoZ2JWUTNRelljNVJlc203Ynlx?=
 =?utf-8?B?cTA5R080b3IzVmRNWU9JUHpOSjhTY2VoSVpVKzNQRUpuWUxiSDNFMTFHdGJy?=
 =?utf-8?B?c0NpSFcxUC9mMTNiV1E2YlI3LzhMT1A2YWRCSDhXZFhCOFp3M2lSelcyYktP?=
 =?utf-8?B?bmNCSnJHcUtIZGtyMG9CME9IOExqbFRFdTBiWFB5eU1RakRrVmcwaHZzQTZ6?=
 =?utf-8?B?ZGREM0d6S3N3T2E5bWQ4RG1hQ0V4SGdIZFdBL2c4L05MYnRQYThFdzA3UUJx?=
 =?utf-8?B?cVlKNU1JTHR0ajY5OStJcHVoUlVwMkQ4blpkc0x5ck9uT1VsMGlpVWc0SUFr?=
 =?utf-8?B?UkdiUFh2WnRSK25vNUxPdjdRdHBob3BNWGwyWXJDbTlRWmpnMUVISjFTcDk3?=
 =?utf-8?B?UFdNOE9wdTVlZGdNRmswcFlJWXN5Mlg3ZlIvMWh1R2FxT3UwTElYU2pWZ3FI?=
 =?utf-8?B?S3VTNXlFU3BVcFBYTzlRTzVPTGJyTEhMZjFHK2Nkbmo3STd5SFRiRFRmUVZE?=
 =?utf-8?B?a3pQS01weTFiM3p2YUUvTHNhT0ZQWDlkaXFlSCt3VU9NR1pTR01MaHVnREhG?=
 =?utf-8?B?Q3pPMlRkYU41S0VNZWJoZ0UyNlNyYUtmQU1xN1RuWkp3SWNnK0lLRTJSRkNK?=
 =?utf-8?B?dXZvT3dxK1ZqUnUzT2htYVVUREtodmxGTE4yY3lPaDEvdHROanExTkdzdGR2?=
 =?utf-8?B?Z2RldWdNbXh2TWNqSlUycWhJbkN4YjZpVTByanJHaVA2QzF6NmZMSHFQQ0N6?=
 =?utf-8?B?dlQvaXJveVptQng2dldqMFJXdENRRDZidUpwRS9lZmJ3c2JNTnVuRGxKTGEy?=
 =?utf-8?B?UmhMVnh5Z01XU1IrdmVPMEZQK0tsZEFBbnFjWnBBWFI2NklUNW5SVTVqcGNN?=
 =?utf-8?B?eUl2Q1d5YkdSSGJ4ZVVaRk9FbUpRMXl1enE1ZjB5dDhieTgwVkZYZTA3VTFG?=
 =?utf-8?B?b3hIMnc1WW1RNDlvS0s2ek81RDZjeXZ4bGJXOFNweWJQMjR6K3lmUkloekcz?=
 =?utf-8?B?dFZ1MGNFSDBmeXZUTWhKTnEwUFRBMi9Eb2ppcXZ3YUxBbERoZE5oWUp5NlRu?=
 =?utf-8?B?QVJxWXU1VHRQS0lNMzJkOXhwSGZpUlVIUzV4RUlSYjVCZUVwVnF0R2pxUjMy?=
 =?utf-8?B?YUxhRzB3ZmJsWG9zRHZtTlBKeWFDZVYvQm5ZeGJpUUJMSlIvL0VUSy9FbVJB?=
 =?utf-8?B?WVQ5MlV5SEFlalhJYXpoQU53L3FpM21yQXpaMjNIc2Qrc2F0Rk5lamhmZ2g3?=
 =?utf-8?B?WFptTDArS2d1ZmQyUlU1TEovMHB0RDc2c1Y4Nm1QaDc0YjhMWURTb2k0K1gz?=
 =?utf-8?B?SWFPYjJxanhJOHJGNm0vWmwzbnV2YTRxN1JBbUlZb25uZ2tmQ2Y1Z0F3VFUx?=
 =?utf-8?B?S3Z1TUxWOFNZVTJwV0Q5YkNjS0JwaE5GeWo2MDV2SUdEVlN0aWRGUFd4d0dy?=
 =?utf-8?B?SlVFS3JTQk9VZFZtUDJoUDU4bUxPMXNOMXYrUDhkNlhUcldnTC9MTGEzQWNJ?=
 =?utf-8?B?cEFNbnpkZmZaZmp6aWxuamNWT2JPTHlDQzJrbG1nSXdRMEMvSDlnTEgrN2tD?=
 =?utf-8?B?RjBBYjlUZUNPUmhqVWduR2JSY0tNejduNHdadlM2eEExcExncnp6T1hRZk5v?=
 =?utf-8?B?cmkweXBaaWRNRTVFdlgrSW1qdng0aTFSNEI4WDJhaklaUW9oTFNKYi9EaEo0?=
 =?utf-8?B?c1VBSjlSTkxiN1p5bmhVQTdteERJblZwMmpnK1Urb1F3dXpWbTF6N1VFTDFi?=
 =?utf-8?B?ZDlUZHdUNXdMeDUvVS9Ed0JvblFUcUpXYXJNbENicTJTMVptMUxVZTlSV0F6?=
 =?utf-8?B?c1hOeEJCcDhHUDdySEtTbHV2TVdKV1YzZmEwckxyTFViVnhBUXlYVkFISnFq?=
 =?utf-8?Q?ouwf8tkHoCeWePhLnD2ESGJeUMKhU8wTj7ElmYBcELss?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3883aee-5140-4c53-ff4d-08daf87f937a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 11:40:04.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2XiyrWWMzc8/6+inVBCi4WQ06FIOHqK0HW9PkOmT1QBqYbcl36i/JTWyUO/LEpYlfeRC/vGJuq2KEkYxad1aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 1/17/2023 4:51 PM, Jarkko Nikula wrote:
> On 1/17/23 12:38, Andy Shevchenko wrote:
>> On Tue, Jan 17, 2023 at 04:01:21PM +0530, Shyam Sundar S K wrote:
>>> Double checked with our HW and FW teams, and understand that (atleast in
>>> AMD platform designs):
>>>
>>> 1. BIOS actually programs the BUS_CLEAR_FEATURE_CTRL and also enables
>>> the detection of SCL/SDA stuck low.
>>> 2. Whenever the stuck low is detected, the SMU FW shall do the bus
>>> recovery procedure.
>>>
>>> Currently, the way in which the "master_cfg" is built in the driver it
>>> overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
>>> cannot initiate the bus recovery if the stuck low is detected.
>>>
>>> Hence this proposed check should be sufficient enough.
>>
>> Maybe you should elaborate this in the commit message and/or the code.
>>
> Yes indeed. Makes obvious this is not dead code if somebody looks only
> the code and specification.
> 
> It is also important in the future if somebody adds the same
> functionality into driver that this AMD platform must be taken into
> account in that code change. I.e. no two instances trying to do the same
> recovery.

Makes sense. Shall re-spin a v2 with the commit message edits.

Thanks,
Shyam
