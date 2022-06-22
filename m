Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F32554F73
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jun 2022 17:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357386AbiFVPg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jun 2022 11:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355707AbiFVPg0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jun 2022 11:36:26 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE4839835
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jun 2022 08:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL0ooSRp0dJDVwp1G2rA9dpwnUMm4ukayCtykJUQuANTefXOOXfyafXdLzxB8+l976fivTtHFEIDUIgxRuLM9zleCPmmugIi14eLLibpDgs1gpYlGS0xBWzf0QwIdB30m+/zjdhsvHgGVTwgmijSVkEQoX09osApyM1ENQ3Cny4W68f7D03VML+sqILhmOcsUlIc20TLqhKHMvlQbE8iR5iHVD46zBBqoRNYIRv7pupkNo//5uB4eGEJVdnLI+5Mc0WkbiozQ1Puzm33MhmlewXLb7ioeD/rKpvR3y0SqIBTGjXNbaBc1HmqMx4YNDlkSkGLUv9D3izEDBIz5dxmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBrpCZdkiCMBNOYMvj4V+YvBnvypKZXPa4aLj3SK1Xg=;
 b=f4uoUYCIemgulYieSzyp4WfiHont3xUQeWMVFuedhaCtMx+TtvBeHjoT/HqsArSCzP8gqJrVwNxovsiVjvbWmc1fTkgSUzXSdbN/cGpvuFQSMMpTnAsdIVhKDF//J+dYRGwfIJPkka1odnzKBvARdFshkn0FV6Ece5/qX1ljlLsqYqQfGoBR0w7pVgg3LPvPEWqTGSs59GiwYLGdzLJ6aTMADZgV52yxO9kfwkqZnGFJi0tUWxJh5BZuaOxy839bWJ8XY3NVQ+gDvMGnhBnl8nGDIfQ8PmaCH1NwpHec7XEfPCByGnnScHSHevcguHY1I9m8k18VWxq9qV22PrJq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBrpCZdkiCMBNOYMvj4V+YvBnvypKZXPa4aLj3SK1Xg=;
 b=YsbQ/JyvEIOxxaYEFctjbzgaCyBQ/Yf1WpiBsTy4mkoE4bQqWCiB7Ism/3t1bUqHXLv9+bPRKMVujgvvJiErLdoaJmap7YuS0rLJ6sQHveHhysepPUjD8F8IZYr4pcvFs/lf8GXQv0dPIIvWrhKKW1ebGmDB7xT/g0XqPv7ECxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 BN6PR12MB1204.namprd12.prod.outlook.com (2603:10b6:404:1b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Wed, 22 Jun 2022 15:36:23 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::ed55:e138:4e33:611e]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::ed55:e138:4e33:611e%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:36:23 +0000
Message-ID: <999becbe-0e22-d12d-e6e3-9136c8c51450@amd.com>
Date:   Wed, 22 Jun 2022 10:36:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] kmemleak from driver i2c_piix4
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Yi Zhang <yi.zhang@redhat.com>, linux-i2c@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
References: <CAHj4cs_NnJLYwhxPvDGnu4QFwS_XbgeJ7b2jOcDvBM3F+w7z0w@mail.gmail.com>
 <20220617093818.37a721a3@endymion.delvare>
 <CAHj4cs9d+j-Dc+wKK-gat3E0McZ5+2DqQhESYitSrS8Wr4s2YA@mail.gmail.com>
 <20220621144822.1d9228de@endymion.delvare>
 <0ce578ba-cdc7-6084-6119-10170d5e80a1@amd.com>
 <20220622083921.69c9f359@endymion.delvare>
From:   Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <20220622083921.69c9f359@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0001.namprd05.prod.outlook.com (2603:10b6:610::14)
 To DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48b2b844-f490-449b-fc79-08da5464f63b
X-MS-TrafficTypeDiagnostic: BN6PR12MB1204:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1204EE1482FB9CC551B632A583B29@BN6PR12MB1204.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cFDlel27DpvJ8mrH+dEFeH9ZyLm4MrJdQym9iTX+kxrrYpO8WRvmXZM/ZPDnNategH2pYTPyP6MA4sFD1QepPZDbsePkEQt0wW/KreWHRToJlkLNbxH0F+usCXr+8ubgV9UzYKrK04FTUCp6CNsQJZ19puiKGcZ0HkLPnRARCDffNMCeST7cmpJkk/Wn8ttwTs23kzSaHGHFK5K9lL4X8CMQEH6H6XmBIg3Vv9JA0Ckcijmv+N0nzUsAtAdCPp5psIbseuS15zxkza5o4q14aHek4u8O0iIRPNlv7Xz77efz1aJ1ttFKWAmxrs1J2Siy/WabX3MaB7w6e4g0Py5OObtMZERyphGmd51qLDF9TDfXd5UKbGZqCZRcmDniAkySIeOPxZsCfQgptAU98XRiYl0NooBKR5e4r//VYdRJqBgVUWk8ENoCaGPM8tWCa6yRk6JUM+IuONLy07utZfZsSp+wMSA95h2Lo7IYxaGWqEGJ/CGTEFmpLPwwQ/Ka+iGnQz4h6+WKADtrlXu3RDhdDkX7XXV3Huhn3urPj4Ya013YfSYOTI9C3KyKXxPXnCznIOcXknQ6G/NDTQKQ3dxF5AlOp1hEbn6l7J3GZIJeKFfP92AswsuW002/KXb9HqsGVpWrRvbKMnsc7UsZ6VEiqNNS99YBWRzKYdvcZSu8/04GE5/wX3LtC30hAMJNIa7JnltL6ZwXC8q8UFLk21HPskMR2PiGxhdQE91miOwjgl7FXwhfVGsw6H7pOSWZhrFRyeOXk5yWNR7fj9C/rj9CG8rkWbo4RtfAdrkOLz0MZE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(66476007)(8676002)(186003)(83380400001)(66946007)(5660300002)(4326008)(54906003)(6486002)(478600001)(66556008)(86362001)(6916009)(31696002)(36756003)(26005)(38100700002)(6512007)(41300700001)(31686004)(2906002)(6506007)(8936002)(2616005)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25Sd3B6WTJXUERSRktOYTFDOXdXZk0yeXRjUHZIQ0w1aklxSjBZYW9jb3hZ?=
 =?utf-8?B?ZGE2MUtsOThCNHdzR3ZVU3lDRXdINEFxQ0xKL1RGMGM3aGYvUjkxMmxRRWFv?=
 =?utf-8?B?SDl6Y1dhUkVRM0ZiOVg0cDRWZGJoaDdyeUt5R3FjWDdLaVBtdExaSE4vRW5k?=
 =?utf-8?B?VGt3R0FxRjc3NzcyZ01HclNHdTExVXZOclA2Mk9HSG1MVUs5Y2gycWwxTXgx?=
 =?utf-8?B?TVU3Ykc2RXpWcHQyU041Z1ZHeldzb3ZvMm9YZklzemhiSTNHc21DTzhMeWZY?=
 =?utf-8?B?WmhydmNFdEhhenBLcElqY1phR3lITEtYOXRzcDZPNElZUndYTXllajhwd1ho?=
 =?utf-8?B?VjUxZnZMUW5SWFRlSkJWUDY4THZGWVdTbWh3S1lxRkpPVHhGS0NiU0pxaWxt?=
 =?utf-8?B?Y2FaNzB1b25lZ2JPZUdMU0c3QzRMRm93WldSdWlPSWtqenJIbnJyQVNqNzRx?=
 =?utf-8?B?bm8ybWU5eXI2QXljM1hjalRjRWVlWUFXZ0VQM2lERzc5UWFJTTBMbGhPeVgz?=
 =?utf-8?B?NDM2NnhTNG1sNFR4Rno3RGFyZTFuTENOS1Z0cGN4NlNsM2xUTDBha0U5cUZw?=
 =?utf-8?B?cm5HVXY2RFZnL1NBZnVDR0NXMDhvMTNPY0tOc3FLelVYM2Q1Q3BIc09HVVZ5?=
 =?utf-8?B?VUJ0N0pLdVhHdXRTRUNCSHpiUmtQT2swYXBBdGtJL0U3UGNsdThqVmUrdElH?=
 =?utf-8?B?eW5IWDRIVU5uVlI5NkxyUGRSb1BYM0hSK3BabmlCbmtBditrNjljYU5UWFZR?=
 =?utf-8?B?MGF2S25PZ0lMT0s2Q3RTbFJTVERsbENUblpVd2V3SEphVkNuKzAzSUxZTGxk?=
 =?utf-8?B?TXhqNCtJZWJUM0hQcUt6MCtaSlNpekhsbnhaWEQ5UHc0TkZKZmVKNmFxenBm?=
 =?utf-8?B?SWl4UEVzQ0QySHl0UEU1WU9lTFVPbis1UmdrQlZnQXpyMlg5WXZMaGVncm5v?=
 =?utf-8?B?Qks5Mk1UcmpPWXZTRHliOFYvZFJQWkNZQUlBUDlaaTJUVGJzRVZLSHdDVGhv?=
 =?utf-8?B?dEE4QVI5eDkzc1dmZE4zTG5vcS9iZ29rU2NaNEhZSXM0Z3BqOTBmYTFiSDVr?=
 =?utf-8?B?enY5eWs1YmFld3Z3b2hDZGZtQ2tCS3pQODRZbHJWaVhMNnh3MW1OVG5DeXlt?=
 =?utf-8?B?YVdPaXltK3pIRzU1aFROdlRONkg1S1ZueFVoUmJMVDJWL0R1S05QTlZRbDhU?=
 =?utf-8?B?NmZrOWZacGhkRGpJQzAyb1E0bElZbU9ObW1oSld0SmlrMGwyeFVJTUJkcitZ?=
 =?utf-8?B?VlNLL3NPbjUwdHhuVnJndnBXbm9TZURSRDBEUlFTNlAvS0tHRUZnTTRmN3lX?=
 =?utf-8?B?dXR3enMyVkdVdVlGWnRMT2owT0RoU3lwWHJZS0VKMEw0a2pFcjJlYUovRkJN?=
 =?utf-8?B?cmhZbHFFUDJVdlMwYmZXaEVhUjIvNGdUcjFVZUoxUEdiSVkvTWRuUDk0ZDlw?=
 =?utf-8?B?U1lGQXp0cDZnaWZCalczTzZhb2d5UWJDNE1mUE1XdnVKRVIrTUZaaEQwQWl0?=
 =?utf-8?B?b2hiUnVvdkhxK1M2c0pzSUJ1S2laWVdtWEdmZ01LbzJFald2aHJxTVlTOVBh?=
 =?utf-8?B?dUhLZXAyUE9SM0N5SEtPUWR3ZmhSYVFJMXFFaE5rc0Q5VzJ2N0pkMFA0TlBW?=
 =?utf-8?B?YVNReTdUdEtpdDNPMEIyWTRPUURJV2FvYUxmbFdwNTcvZEFiOTRrOWhyZnFX?=
 =?utf-8?B?S0phZzI1djRPY2ZMSXpsV0pCbllMZFQwbmVlYk1JNitQQ2hSMkdvUjJSTDh3?=
 =?utf-8?B?MXltRExRYjR0KzcvWlNUY0dzV09RTmlzUXBUTnVvRklyNWJmQTVOSnE4Wk5S?=
 =?utf-8?B?ckRXdVhNV21LdWNZK09hTkdKOFdWVVIzdFg4VGlOY2N0WGZmTi9hZDEwamd5?=
 =?utf-8?B?Y0ZMY3ZwZTZnYUIvZXYwd3d1Kzlmb201ZWJTRUJGenRGNkVoQTZia2NmOUVz?=
 =?utf-8?B?dUplR2tnWnphN2dPNG1iQ3RyRnM0dHMvNVNUc2hOTUVqTjZ4WkRraDhXM3g5?=
 =?utf-8?B?V1hPMVFnRHNydVYrK1JKenFYTmhNRW04OHNBRyttcDQySk9YdloxU25yWENI?=
 =?utf-8?B?WFRmd2pUY3lBaDFacFFTOGF3SHpId0oweTBUaDFYV0xGbTh4RGRUSFJvSDND?=
 =?utf-8?B?UkR2OEd6NWtHMm9lNktDYWV3akJST2trZm54aDEzb205elk3ek1xR0lQOXhN?=
 =?utf-8?B?VmxpQ2VMWDJkZzhMODFOQzlsNHpDbjRUVHhKSGoxNHRLMm9zRlY0MkpVVHBa?=
 =?utf-8?B?ZG5ralRtOTdkZHZwSm1XNlRDTTNBRzczQWZML2R2a2crdGtLaDBodkMrVzhV?=
 =?utf-8?B?MFZ2b05FZFRieHVpVldab05RYTdZYi8rdG1YRXUrM3MwQU80eVd3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b2b844-f490-449b-fc79-08da5464f63b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:36:23.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd7O8wtub2ier2FBr1pc03j0aw8kPeFiMZUk2NDKYc7EeTjfpx0dr+3VljQdSTjtGNYFqXpoemja5aXi9UXMuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1204
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

My testing shows this patch fixes the issue. I recreated the leak issue using 
v5.19.0-rc2 without this patch. I added this patch, retested using kmemleak, 
and the problem was not created. 

Patch inspection shows this fix properly frees the memoru resource structure.

You may add my 'tested-by' and/or 'reviewed-by'.

Regards,
Terry


On 6/22/22 01:39, Jean Delvare wrote:
> Hi Terry,
> 
> On Tue, 21 Jun 2022 09:29:44 -0500, Terry Bowman wrote:
>> On 6/21/22 07:48, Jean Delvare wrote:
>>
>>> Yi Zhang, can you please test this patch and confirm that it solves the
>>> memory leak?
>>>
>>> Terry, please review/comment.
>>>
>>> If my analysis is correct then the sp5100_wdt and thinkpad_acpi drivers
>>> suffer from a similar leak and need to be fixed the same way.
>>
>> Your analysis is correct. The kfree() call is missing during the release in i2c-piix4 and 
>> sp5100_tco driver patches. Let me know if there is anything I can do.
> 
> I've submitted patches for the 3 drivers. They are pretty
> straightforward, but anything you'd be able to review or test would be
> welcome.
> 
> Thanks,
