Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0FF560106
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 15:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233253AbiF2NOB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 09:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbiF2NOA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 09:14:00 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50101.outbound.protection.outlook.com [40.107.5.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AA519C22;
        Wed, 29 Jun 2022 06:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3l0dLxi2Ox6gpWYY7fr7fasGIVgSbCKteij3RPGTZ9BNqB81NavCpC7NHjsY0Q2M8+pu2O2dPnIxFAMuhzJn77F9s/dUaC5is7vyMO9QiTgEuVYN8FmdVVEohzFI3YOdXdezwA5hagumcqFETMysgRBFBPk3N5sZLXvlFGgK9JOIsb9MXB5jaiMRAYOhh9W+oxU2nA2LCuHws+3a5PYmO/jDf1pA26l9bNmVYP1u25sZszmakTMwB5yojF57fhHtCaPfSFfgQzosV8EkuHnjzcFY52nDHdjZW8YqjDHQZVXIiZDXmI6v/aUYEiSHin9NfnTHhpCbmEFs3tLz2iyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVPMPKGY9YALVzy3/Fuf92Yn/eT1QDdy2XEyZ/avEek=;
 b=jNWtu6ImvVknsEyIZjEgDk9peshoXKFGV56M1KSZzL6cMgRYBtlFTPuhAu3jsz227tAOLrPlzF74ofAo3f5jDndhzqWDG9QtG4/MAqCUHk3xz9qw04JEu7gBqcz+fyaqRCqbp0aAuynkQVbY5ebQmEcqckUihrsXyl0be2YWAX36sVueNPs3itbOHNJpZd5VxACg9S7yJyfhlPTMydUk+xxcXa+nitFbGngZzsOd2AGMcTeOm3i9cYpeGfTge2m6wEjcJTJgDMBoXLI+Mlg/RMEoJrYwJYkzodS1mfYutk5laGqdluoJJM8Ix0gYs0BYU+sy8EoQtjMv0I0PTHJh+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVPMPKGY9YALVzy3/Fuf92Yn/eT1QDdy2XEyZ/avEek=;
 b=Dm6OGJiZ+lSXOMIDqtCr2jGrUCe5pgyMtV64Xo8fB9kMgGWLGsd9DAjdM0dlYHXaq1YvtCePqMhbJYx0W1FPNH+p1KTPbGcXLx5XJDvCR44HWOcG3qT1L3nH2250kyJF3pluJvMcHxB9nmdS8CKdcNOQfSds3fjqz2jB+qquABw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by AM8PR07MB7665.eurprd07.prod.outlook.com (2603:10a6:20b:247::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.11; Wed, 29 Jun
 2022 13:13:50 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::8885:ac49:4a47:2293%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 13:13:50 +0000
Message-ID: <6a0df607-3d60-fd8d-54d1-3eb849d9c035@nokia.com>
Date:   Wed, 29 Jun 2022 15:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 12/12] i2c: xiic: Correct the BNB interrupt enable
 sequence
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, git@amd.com
Cc:     Srinivas Goud <srinivas.goud@xilinx.com>
References: <1656072327-13628-1-git-send-email-manikanta.guntupalli@xilinx.com>
 <1656072327-13628-13-git-send-email-manikanta.guntupalli@xilinx.com>
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
In-Reply-To: <1656072327-13628-13-git-send-email-manikanta.guntupalli@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0239.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::15) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a500a2e-e794-4349-1308-08da59d13513
X-MS-TrafficTypeDiagnostic: AM8PR07MB7665:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RsXS15lFSqT4Z60FMo6+tIMaYDyeT0sgXkePAiMgQ2vbJ/w/Wp6dcwv+2u8fddRcDrc6sR0XOFxT0zkO19YayZCE6HSClj6AUwD5fT6WaLGLHUkvKiK2ORi9RqP25+EUEN4r+xyvOwxvQj+nRjBhBqETBfuSYueLoZBc8gQcr/KZieV25lOTdZU5aJrBccwJBeb74KCiVntVnY18eXMi87WO4MNNkyimMqKE8pas6TdMYYer4PmfJvbUZmHvnjFDZZmbwhPxjKIsdJtbk0CQrgJI9lF57/7ZMLLYzLrencvoyh45FYza+ktki+qFBYm7/8eZtP9zwLcZ950z2h1A+qcrJWOR13kzOgnQ37yDrB7UrUQHYJqS0qdAjxnHSS6isDP8NV8YX/iDYwIjSkdiIZRJYy5RQq3pgaON6cX+kj/RSht8mxn/TcQaBRpYcNEk2RjD7kw8y4H6+ZvcCsCDpbVFJZpbxf43z8tQP1PSddCyFmsaCqHNrpO5cN4Ufw+oKo43SI9XG8bnZ476c2KCA0RJM2cGeW27APLH++JfSdcfn+sR7qRa+3+uzm48awUIK2ok7Qcl7cLXVkNuVfvIPFh4k2jP97cA0kJPIom5OnIOjEnAeRDnAwyEHl6wxGH33eBQOQRZrqxLH7Z/ByMOzYHH6wMLVjL4IAvwJDgHIcirBuzDoCsrxTIMOu/ZeDfPJ3JzvXHx2BZDorDxUDmkl1a1UXI2N3aOuti1hln2yGkeiF/AGWMHWemLEathzdeVp75cibVWalpDk1v+d0d1QCqYshhvHzamiLZzlIUMfDkudCYRA1x8GKOTLt1X6b/MQ0pocAkzSU3ECts1Op/AiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(2906002)(82960400001)(8936002)(4326008)(8676002)(316002)(31696002)(86362001)(38100700002)(66556008)(5660300002)(66946007)(44832011)(66476007)(2616005)(6666004)(186003)(41300700001)(6486002)(478600001)(26005)(6512007)(6506007)(83380400001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZJUHp4SUF2aTJiZ0pkL2Z4cUZGZUtlbzNpcXQ5Qi9uOFdnZDBrR283dG43?=
 =?utf-8?B?eXZhRDR6M0RiQjQzbDN2ckJuU21kTmhFSVlZelNFaUM4bWFuOWNZK1IwNnFC?=
 =?utf-8?B?cVViUzYwTElDSHhPSmlBTThHNEl4TFpmV09sMUU3ZzhCWVRGb21sNVc3Zm16?=
 =?utf-8?B?K3RTa2NzZXMybkIrQi80SWI2Y1B0dmVWMTVBMnhnSVlDcEhpS0dFSVBwVFVB?=
 =?utf-8?B?elkzWjA2YVVnWGZvOEpKMk9lQ0Iwb284MjdvWVhsZ0NGOTZrck02YXlaZkht?=
 =?utf-8?B?V01paUVvYUVXQVlqK3hHSk1NOEhsYkxQR21WWFZsbHRhTVplWENzUXN0N0U4?=
 =?utf-8?B?aUpTYURKY2twY1NJOXdZR0xtZDAzS2o2QVdjMWtmNFVBWHNBRVBiNFBGeW9P?=
 =?utf-8?B?QU41TTBneXJrRi9IRWFWYnpxZEZGa2ZUcG5Vckh1S25qSk1YWkREd1g0dm9z?=
 =?utf-8?B?a1hSMnViWGNRQUdqazFBT1psa0cyTmhTZ2FEdmxiRzQzYUErUVBpZ0M5ZStR?=
 =?utf-8?B?cnZQWHhVbStQVUpVaTRxbFU3SjYwZ3U5ajVoc1ZTd0RHNnRXQm94RU15Q1Zu?=
 =?utf-8?B?Z2k1RnRBQlpoeUhxcGR6QlJHT3FkR1QrMWFqc29OK1Qrbm5TRVVmY0s3aU5i?=
 =?utf-8?B?UXBHM29Jb3dUbWRBWHpIakk1bU5LSHM1WVppdUxmREppbW5ualpUd3JZZWh1?=
 =?utf-8?B?UUR3Z0drWXgybjVKUEl3MTRSYUN3Z0hqa3preVBZUnpMWVQ0U3o1ZEsrZlVt?=
 =?utf-8?B?TUhaSThkMlNqMEZYNkJJV2Y5RFdQOXgxb2h3TDlJcEtjS2JxdUNWbVYwUFVU?=
 =?utf-8?B?TDVwRU1pMTlKTGREaytSSHM1YWYwY0dLV2QyOGRaTjBLdUs3NjZsMy9qMUNn?=
 =?utf-8?B?bFd3ODYyZkd1czg5ZDBpamQ4V1M1NzJzd2x3TTlEbmtLYVVzMjhXa0UreHBJ?=
 =?utf-8?B?Y1VXbE9wSG1La3lRUm55RkR2VFJHN3JhUUZqZXVCWU1reWhYKzJpUHNVSUpC?=
 =?utf-8?B?UW56d1NidVQ4MitiZEJGZ2RGQWhBQXc1YktzRFNwcWpQaW96MGlZd3p2S2hx?=
 =?utf-8?B?YjJwVW9FUkx2TUU5K09aM0h4S1Z3a21TcHRGS2c3SVVXaHlaNXVESS9acFZU?=
 =?utf-8?B?VXlOUjMvQTVpNVFEYWJ0S3lRSUIrTUs1Y1JFa0VIZllqRzlzWVA0ZnhwUDVh?=
 =?utf-8?B?RmRnTURNOEhJV1k2akFsTUpUL04vK0RmZ1Y2U2lRYVAzZUdiU2NKaHdLSjRN?=
 =?utf-8?B?NXFueXlQY1VKVlplV0QreTBvTS9PdDBRVFJwOHc2ay8xVmF2K1RTZ1dvU2tE?=
 =?utf-8?B?RTBrVUNTMTJGbm1TaXFuMHgyRlRXYWh6UHpiSXA2RTFyYnJzdE4xUWlsU1Fj?=
 =?utf-8?B?cVJiRGc1ejZDekQvd0xzWG5LZlkwQk9ab3dGUTI0bkdoU0xXeTlYbWl5V0p6?=
 =?utf-8?B?VEFYaVBQQnpVRWxyc1VKY0JTNzEvcnFJc3g5MzNxK0JDRUR6blFxMTZuRWty?=
 =?utf-8?B?ZkYzUEgvR254cVUzZHJIb1I1TDRtaUlwdUxsMXhmcThBZngwd3owZk9mcGJn?=
 =?utf-8?B?eCszclBjSU0wSU8vcHlsSzE2VWNWLzE0MVEycEF1eE9IMGpHRXV4azJtV0NB?=
 =?utf-8?B?S0s4RjZ1Uy9KUVRLTUJNd0VFakR1VjhZZDVjeWxLNk9JL0RyWWh3c1FwWHU3?=
 =?utf-8?B?OGNYcnZYS2Jjd0d4ZlprTkxxUGpmK2wrL3hFZ2xWV3ZLT2JXVTJFUm5pclNz?=
 =?utf-8?B?ZUdqUXFJd2FqOVNYWTJ1N0FkWDVCbnV2WVRHbHJIdmVUVkhKLzZ5SDN4c0hD?=
 =?utf-8?B?eWFKWFhmY1ZmcUVVWGZCbk9EeDBEb0ZROThSU1lpbDNqUWZLY2x6bGNWeFpt?=
 =?utf-8?B?ZXRSVUVhSmRpbmpmNHJxYVdVNWNFeWdrOCtxNzhmK2tiL3U5ZjQ1ckVSb29W?=
 =?utf-8?B?c1ZmU3lUaHNTTFVmek15aTZhNXFabDBudERodm5LK1Z0eTExRU0xdUN1RXNk?=
 =?utf-8?B?cFdpUGhYekFIcW5KeU5hVU1vWC9zM081Nnc1WGc3TjRRbGc3NWl6RUNDOHpX?=
 =?utf-8?B?enZsRkMrQ3VUcWJaR2JXcnpkU0tRUTFIWEsxOWdCdUpPRXkvWi9wV0ZkUEM1?=
 =?utf-8?B?aHdpU05rWUFURjlialN1eWtzR0FVbC9BTXJKTmU2RHJpSysxQ2VtU2lPK3J0?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a500a2e-e794-4349-1308-08da59d13513
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 13:13:50.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X021zS5Y9Q5aA7244UV8dqHIP2/lPBSOi0v56K+emmwRTxrUtef26vwdvxLuoP1vqIm21Lxl/pBZXqjI/ThLAvunr/jRVK+16rE6ohx/Pwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7665
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

W dniu 24.06.2022 o 14:05, Manikanta Guntupalli pisze:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
>
> With updated AXI IIC IP core(v2.1)there is change in IP behavior
> in dynamic mode, where controller initiate read transfer on IIC
> bus only after getting the value for the number of bytes to receive.
>
> In the existing xiic_start_recv function Bus Not Busy(BNB)
> interrupt is enabled just after "slave address + start"
> write to FIFO and before the "count + stop"write to FIFO.
> Since IIC controller drives the start address of a transaction
> on the bus only after it has received the byte count information
> the above sequence can lead to spurious BNB interrupt in case
> there is any delay after "slave address + start" write to FIFO.
>
> This is fixed by ensuring that BNB interrupt is enabled only
> after "count + stop" has been written to FIFO.
>
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@xilinx.com>
> ---

[...]

Does this spurious interrupt cause any trouble or it is just ignored and 
the only problem is unneeded extra CPU load?

Krzysztof

