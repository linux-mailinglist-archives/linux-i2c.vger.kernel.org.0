Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD475EF004
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 10:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235070AbiI2IHi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 04:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235296AbiI2IHg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 04:07:36 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2111.outbound.protection.outlook.com [40.107.237.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02456D4326;
        Thu, 29 Sep 2022 01:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdWWATwDU5HhtdGMfGpeDXt1fb/rXtFjVyknmv1CNyPDxXpmCeGLYBvF0H3DaNX9F1J9/GPaQiXciiRBvIORxCc1ciRjnThmYZxa5TVC9D4YS+A8t115QSYPklZukEtdFsfMOnESSMuI9n0ADyr12XHv9GIFORmErmmeP1YvhDRoXg9sGir05nj5Y+8t7MvAo1Dcv973Rfx53h84eWbCspb+qcww3HcH+28OHYfdqAO5Bg9clnuucxDvfiZGj9N/jukNjJekVpN7uAIFJAoHaRFz+/QpkOfNYXCv674V+fO0kgsz37bNuXbh/yNgMzt6jwCGOsVOTg5cZcyVCwgcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FscF5ccqMHcBu17ybPxQXeARpwz+IvVYFb7v/ImsrUQ=;
 b=B0EEkbx3PU0irTvpid0Xwapn1737dpcYRIUH585eHjYXmS0nAb7qOoaz9ycISz/Em8x56ETCdZZFpNwJ+63p+R3bj5qwQw0MQ2JeoPp8eGPbH9PIygafdW4fhFqK+qFnWDb0WIe44jAk2W1SSSRYRweEQycU7CX1e0N1XYqujuvTAJa/6bB4fkkVjDX6DNSF+hdg/MKgh2VZk03u/4vT5OgMqyRb/W2c1PpQxHfRWtNA9LS6Eza0eWmqPp/cunFAVWTemQbOQ3HrQQW2XStrHnGqw5GPwhpHympfCyxGoSVu7XI/OR4VKiuJ4sIiG5rN8A4EqEsRO6QxBlTalAVElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FscF5ccqMHcBu17ybPxQXeARpwz+IvVYFb7v/ImsrUQ=;
 b=qLG34u2POYVxP0i8AYTTKPdFGXIn90GwWixbimuVn1zkfpEjafvpIxNH45efZVgOkvjlW34n636bp81L7yquj4vJJa7E0DeND76kHMj5bHEmX19u2OAisuy1XZU19szNWTFFX4lHscrwtz6iLXB1V9Az9H8ssdVzpzNDO0fnrY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MWHPR0101MB2912.prod.exchangelabs.com (2603:10b6:301:30::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.17; Thu, 29 Sep 2022 08:07:31 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 08:07:31 +0000
Message-ID: <094d7641-daf3-dbda-3603-8b4f7f640e38@os.amperecomputing.com>
Date:   Thu, 29 Sep 2022 15:07:23 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH] docs: i2c: slave-interface: return errno when handle
 I2C_SLAVE_WRITE_REQUESTED
Content-Language: en-CA
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        Thang Nguyen <thang@os.amperecomputing.com>
References: <20220915035440.2862532-1-quan@os.amperecomputing.com>
 <YzSjaVQUm/B4Jtwf@shikoro>
From:   Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YzSjaVQUm/B4Jtwf@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MWHPR0101MB2912:EE_
X-MS-Office365-Filtering-Correlation-Id: eaccba7b-67d6-4d4a-cf1e-08daa1f1a848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4IH5YG4H+2xVBXdl7uxfr3fdyxoKiyyDBtsxBj7UXlUCQyUALuqsW4IT88FFAWIvJjxdNSj2IvJUS1ZOWntEJ+WzhWxblcLNtzXHf0KcSikBPzc69zNGT55P/ANloytcVsOknTRg77OhHUST/gQpsuI5jh6/kQ8S8keiVnLM2D93ff9y5g4A+xrfzfAXxOKt2l+C42L7+Vf3dGZwyLnVY9b6DMQAi2PTXMHimS8sdxtFKwOMQbpPatvUwCsq2sByYj/9QhrYqBk1Mf7AWpTaUk/zbZu22+k2f4gkwL5smwBqmcMitLg8r8zQnY4ysPchOzGZYSyDSJs7lfSvsf4AWEGGQfU+GJA6kOYvqyEY7YCjnrv4bJBjdqxQiunqm0vSQAHjx19bpUvPCn+cMfLrfa2MNkJSRLvuFJrb+cNi/ia3mLtWPwG/TDHRyeNkQygzBSeXYyZh8prI5vCzwHvY7CjNftn2YuUbd6VRWzu/zyFcUuVf8ZHzVVFOxikOFllGufAIKoQBu6AR4kf9enrVR2Dz5eqZ7fNOfwTp8xzSUaSIsPAs+OtDJ7D1fIn2iG6KHtpMWHgPYs6bKuMR1Pm+yeh8Ec1oiwX2SSSd26a1bdtRRABgUCIOXpWKUYMiwIYNRcEAZSvTg3CJ8vYZzBOGGQFS3+hCgCdaDKRddTvHuPnMTDhqujIz0TvfxGV+HPvDjvGIHuB3P7UAAJwf2zlIrH/zRld9sPnKNONYZKGKdHk2NhtB+b91HjXbXH7DAOO3boLbZ+r7AjCGROjU/rhQywrN04t7HXuq08wlFB1FIFYW3kpls3gQTia4v/GU+nsglyMWcW4GXsKiyVCRlffQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199015)(186003)(31686004)(478600001)(38100700002)(6486002)(38350700002)(31696002)(4744005)(6512007)(5660300002)(110136005)(83380400001)(6636002)(316002)(2616005)(66556008)(66476007)(66946007)(2906002)(86362001)(6666004)(52116002)(8676002)(8936002)(53546011)(6506007)(26005)(41300700001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRWTHNQdVVhS0FjYWtmQlRXWHp5b3JvakE2MmpYTFZnOERQQ3p4aDdVMU8w?=
 =?utf-8?B?eGgvdWsrVjZwVk51QlZNN0o4N0RQdjVPbHZmb2VpQ1VRNGxNdFVySE4vVWhw?=
 =?utf-8?B?SVZ6VWlaV2hTTEFxT05EbWJpUXBHRjdrYVl3Y2xPOXBnbEZXeUMxRE41TXhJ?=
 =?utf-8?B?dC9CeDk1Wkhza2xEUWM3VGRQUnJrYjViSmJWWGc4SUhBTHB6U0wxQWpycUJt?=
 =?utf-8?B?U3ZYRFVRbklLUklDZ2lBZ1hBc29XU2J2RFIySi9WVnhTc2VkTGNPdEgvMmta?=
 =?utf-8?B?NFBrc1RkUjJ5dHJPVGlsRFk5OXIvbXUrRGRRTm1YWEp5THFqNEJ0V2ptYTBJ?=
 =?utf-8?B?OFpNUHdFSWorRG55V2ZwNUxBaldoS3Q2Z014MnQvaEVKQThKOXE5Qm1qZFhM?=
 =?utf-8?B?YkVRSXYzcXVvT05uY2doeENCeGZDNFJkWnROdmxFVjRXSFhiYjVxUUtaMzNJ?=
 =?utf-8?B?WUxlWFF3WHJrK0EvSjA0Lzg3MWdnWjYrWEZhK2dpSzBEYjA5UnZOdndmSFlC?=
 =?utf-8?B?aTVyekRqeXJZYkhDSk5FejIwZmdLQk03UnB5UU16Sm95OVJQNFhzZ1owcUdQ?=
 =?utf-8?B?cW1JWVVhM2JtUytrZ2QzazVqRDZHWWFZdDRSYUI2TUY0K2pIZkNJSlJnellh?=
 =?utf-8?B?N1ZXN1ZjODJFN2RwUHpOM05kNm4yeXhFYzlEdDg2MzNoVUJ2ZEhubmpNOWpx?=
 =?utf-8?B?bGFEUVZMcTBmaDNpMnhIcmd6bFNKRzc3MTJGemp5RHg4NWhRRTNybEYyU0hU?=
 =?utf-8?B?UjZVTWVGNXNWNDY2WjZiZjR1dUEzL0NCODB1cFRlV1F5RXAyaVZ4ZHFNQ1hH?=
 =?utf-8?B?b29xZXVPbVhNeHRoR0xBeEo3S3dCRmdIZ2dnU0gxNEVhZkorbEU1dEpQZ24r?=
 =?utf-8?B?WUdtWG54cUY5c21oalp1eWVKM05UalpHdEJhMWk4b0VVMlpSMzdCaWxoZlM3?=
 =?utf-8?B?cHlEaklSZkRkbVpVdDJiMGJNNWR5SStSaFRBazI2NEF4UWs3VlgyN3RvZ3k5?=
 =?utf-8?B?OEpGT0dzLzhqQUZFT1lSaktGaS9uWFRXNDl6SFhWb2kyeGdWT25HektGRHRH?=
 =?utf-8?B?SFJzT2txZjJDWjM5WjJtMVp6UXJabnFvWnpHZVpob0FCV3k1cHZJcE9xdkd6?=
 =?utf-8?B?eEhCa202OFdxU2JacUZrV0cydnllK0dTd08rSGI4ZmRxVXpvN2IxN0d1aFhw?=
 =?utf-8?B?cnZrZ0V5YktxbzEwUHIxMUtWc2ZuSEk5MmFvY3k4bm9FcnJoV1dxTkZTRGZV?=
 =?utf-8?B?UDdIZ1QrUWc1a2FDNkhGbEF5L0NZcGdLS1FuVVlXS1NreTdOYTJ3L3Q3Tk4y?=
 =?utf-8?B?UzMzR3FWcWJKeTZDdnAvQzBHYjU2SFg4d05jVGQ2Z3pYYW9EZTlSYWJrRkxy?=
 =?utf-8?B?MVpqQXJqQXZyZjhIVWVra0VwTkNzcVVjdDdnM3JHalVxQ3l3blZtYWRjZnhk?=
 =?utf-8?B?UTVmR256Nlg5NHZSQ3F2TUFsblRMU1NhQnNpZ2V2SGZWaExnME9LRXNhckxI?=
 =?utf-8?B?UzNSYnkvei9ieDNHQ2lCTHk5bEc2MFplR1Vqa3RCTGtSQUR6c0JQZzBlazd2?=
 =?utf-8?B?MTZ3ZWU3bXFLQkVNVCt4VlRKRGQzOG84MEJSTUdzZHRpTVgxNS9GSXQ4MzNa?=
 =?utf-8?B?eFRwWVlRV0o3b0xFaXl6K2VHUllYc2dtUnRXZG42UHFuTFFBelZNNDR1Sld3?=
 =?utf-8?B?clByM2JvNUVqdllxOEFYbDNaY04reWFkcm5IVG5TdVRwUUdBOWU4aWZqeHhV?=
 =?utf-8?B?c004YjNUeXE0Qzg2QldPRkQzeHQvMzdIejljSlZpbmU5RCtneXRqRWxxNGY1?=
 =?utf-8?B?Rnp5di82Sit3OGxjK1g1SU81TStUM0FaWWtuQnRucS9BQkZoakUybEU2MWMr?=
 =?utf-8?B?bEpsODBWcWU2YUdFMXl6TnI1TG9QRzNQQmhWU3poR0JHZDJja1I4ZFd5Z0o3?=
 =?utf-8?B?eTZpSVFPTWFPbG1UZTVVVjdCSmZvOEE1bzdTYWRud2lHK1VFZmNRaDlGN083?=
 =?utf-8?B?MEtvc3BUNnBOUis3ckdqVnB0STEzYU10a2psTVZ6MWNteDJpMzRZUTFPczZm?=
 =?utf-8?B?U1NhNUtOSXpIN2hWNWprU2JERkpENmVuU0NNdzJLWG84TFV3eFNscWZiVzZt?=
 =?utf-8?B?NitQcm1UTkNIajBoQTFuMzhVZG1wK3lPNk9jWG91NElQWTdhZ28wZ3RTUjcr?=
 =?utf-8?Q?67BxC9AdYb1qKd2RXaTdhn0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaccba7b-67d6-4d4a-cf1e-08daa1f1a848
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:07:31.5441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v47L+By8T3DaxoyQ8gp+xxBQek0d2t2fXyJ9p6iyK+DWQ8wJjfsb8H5HAxSGqswAZqkQuQtT0m9VLgFJVOS43mi2E4CEHq5T+Xrr3kXuVXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2912
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you, Wolfram, for the review and the wording fixes :-)
- Quan

On 29/09/2022 02:41, Wolfram Sang wrote:
> On Thu, Sep 15, 2022 at 10:54:40AM +0700, Quan Nguyen wrote:
>> In case backend is not ready, ie: fail to wakeup or initialization, on
>> the returning of the I2C_SLAVE_WRITE_REQUESTED event, bus driver should
>> aware the backend status and might auto sending NACK on the next
>> incoming bytes for I2C master to retry.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Links:https://lore.kernel.org/linux-arm-kernel/556fa9e1-c54b-8370-4de7-c2d3ec7d6906@os.amperecomputing.com/
> 
> Sorry for the delay. I made some wording more precise and applied it to
> for-next. So, we can use it right for next merge window, if needed.
> 
> Thank you for suggesting this and for your patience!
> 
