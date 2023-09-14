Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152BA7A0F50
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 22:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjINUw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 16:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjINUw4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 16:52:56 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2133.outbound.protection.outlook.com [40.107.95.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53412698;
        Thu, 14 Sep 2023 13:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJW8qd0bsLBtXZF8riXj7X24mB/IEHF7J4n2tLuuUn0MF8ngktqH9Kr4VZiMn1cYqXun/oWqbkb+xTXDmkrtdXQjwnDxMYkmjIPPo8Ztyfv38NpZ06WKL87ewzrXWEqiHaSaiIq1YaUquap/tf+u13T8f0hOAGuzmDWF92Ku7/pc2MT5wW1dtYes3nC2b5a4DlJiiVJaon9a+oVQVKo5yD3sQIPrlf/xg71Ral8WnczkEp6ZMrExhbz6CpbxxC5iGmqICEVVft92NwLzz6QfgFRgZxMnlAUT1RwinvlkGbp9n0lRaJVAvscFcI6H2QR4OcGOpjmBc1NkfHcam19DYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8dd6wS2s6sD86zeFAiyLqlPMp5vaHMGNOTrE0XVEA4=;
 b=Q87joT8OnyVdzv5ZIILgix9Gg2kBJA9PdVWOmdFCOjjz7YkxL0xK2N00YvXW3fTCkRG+L60fPoQaRtfRR/5i0k+Pf4jLJm139Je6oOFnZUhySc1BZSFam0Tv/tOFB/aKIxTsridK/I44qwqxfcpEXEeF0723y04OLxSJiOOOoxvJwhDVFphicq+rvq4IH3b+mn/Xi916bQ1VPW3Fh8HCbtEH2ZYNraEzMCunZuG1tOj93mD7B9Xrd2g5bvnMUjsDDqVPKlVyGrwvRNpasdX6tP6fk5h7vsRTTwUDs1ByniD2j3CCmpm9mNEvn2OQCMv1ZEtOLNRIiKY1GuTYN2f/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8dd6wS2s6sD86zeFAiyLqlPMp5vaHMGNOTrE0XVEA4=;
 b=FBnWiMW8htwwlHYY+Y8bgFNedCR3roYx8hUc0Q4tQdO6z+jAq7Zw3ulWbkE03zRIs8cLMzK54QD2bwTEOZ4ORqr7DV6ThRZbX4/1rUC7FzLOACvEuYDArsRcLgMZESTQ87aquy/fDpcbjjCcxFAaK0TUDadQnqTAiVRIpmFE+V4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 PH0PR01MB6747.prod.exchangelabs.com (2603:10b6:510:7b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Thu, 14 Sep 2023 20:52:46 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 20:52:45 +0000
Message-ID: <07ea65c7-752a-42eb-b28d-d7a84f174321@os.amperecomputing.com>
Date:   Thu, 14 Sep 2023 13:52:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
References: <20230913232938.420423-1-janb@os.amperecomputing.com>
 <ZQNVCVHLQvA8s9F9@smile.fi.intel.com> <ZQNVNfnJ56XOv+hS@smile.fi.intel.com>
From:   Jan Bottorff <janb@os.amperecomputing.com>
In-Reply-To: <ZQNVNfnJ56XOv+hS@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:610:e5::8) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|PH0PR01MB6747:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ae4932-3bb4-488c-5810-08dbb5648c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fRdgVRY1El2arTc5ERdeJdwYbMV/SfHR3CrQS4UA7gS3aIZMlm6QfaU3C6kPEwo6EuFgrlZiINDTR4BN+3Cr4Ze7ZikFdo5MusZXNtEWzpZDZdjwmqIkrAc8i+H8Nzxofmc/o2Yc2RkqzA7u+bS0o8q66ZXVb2P70NSv+YwkHq9zN0Z1N7cPgmMFHMr/g2fLqH+u6qmGcD57RzT5rFixdsCeiCtGExFAYsuK1v8v3z01tu+0RF8Thkk+1RGT4sZZh1C2OaO+yRdludf3fe9BsvaEyjpd5KXNgQCcPcx5mgqJ8A/0aAujvDj+MvJ19OTayZZl4viHBYWtKfV56qKwnGbw73MznXMzU23qozl3eYwnp/zAejRHS3KanxUooWJneY6jCu2rfDoZd4Ylz4CeINMk72Fg/xvks2PVNZRw//mr6F9Mp/vPtJV94JDCEeNEw05xPOG6vhwuNu6tIhTLk71Zm7G47ojZZISgilvigYUXgYg15MtyT2rdYeym8a3zxysYPAK9Ww4PLnS/mXIKt2ZIn1jsUtWuqn2XP+qwuiEz4Eihkr/RTthAMymayBomcmvD4Al9rRfHGGnugEu0a+IwTzMhcGuXfHLlixD8F2WcJZjVdauVUrNEwgW7+zaO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(346002)(136003)(366004)(1800799009)(451199024)(186009)(31696002)(86362001)(4744005)(8936002)(8676002)(2906002)(4326008)(5660300002)(53546011)(6486002)(6512007)(6506007)(6666004)(2616005)(26005)(38100700002)(478600001)(83380400001)(31686004)(66476007)(41300700001)(54906003)(6916009)(66946007)(316002)(66556008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFAvcFIxdS9tekxwRktxNC9lODcwZ01IdTF3UTRmUGJzMnZiU3gzSi9WcFB4?=
 =?utf-8?B?TjM1ZWhpS25CSHAzNzlSaFNzSk1JVzdQOGgwcHhJaldHeUR0RjYxcnY1WlMv?=
 =?utf-8?B?OE83RFd2S0t3bi9GVnNCbG9ZVXFLRUhRV3BZMUN4TUpoaHlYTXN5cHM0WG40?=
 =?utf-8?B?TDNSWVBESEhaVFZlZGlvdHFRblI3aGNxZVU1c0NoQjF0L0ZISmNYNldEMTM1?=
 =?utf-8?B?MmtrbTRCRTVIYXc0aHJHb1VXZWd0aHV4VDY5SEVNNmp6SU45NjAyRFUyVUVu?=
 =?utf-8?B?eFVwQzhlMktoRDhPcU5NQ0hETmQ3OVFJUHIyaWd5djRhUW9qaEROM0x4SENp?=
 =?utf-8?B?bSt0eGkxY1ZDWEZHUEsyRG91UVRUcGpKSjZvK3AweTdGMXpJVWhiN3dpZW1a?=
 =?utf-8?B?eXBuVW0zU1I1STRLQkk0QnBZQkl5QVNpVzFBYysyaGNUUWliRHk3cmE2c29P?=
 =?utf-8?B?akZNUVhNLzJ5eWZVUGRRb3hsYzV0UTVvWTh1UHZoc2RyK3FscTdWdkExc2kz?=
 =?utf-8?B?QmdnK2pyeThwREZoQUdsWGtIQUR0M0NuUUtFNDBZcHIxOWIvYTJ4NGxmd2pX?=
 =?utf-8?B?NVM5dmkzQUJLcHdOVXNicTNEMTVPT3dtYng0OWM5aGRCTUgycWNRTUpzL1NI?=
 =?utf-8?B?c1I4VmhMUFBoUGlWWEEyQ0RaM01LUlRMZ3lHanB4dXlBSzAwRUNnYkhjdUxk?=
 =?utf-8?B?OTB1dlo0MnEzcGc0Q1RNUzVhc01BVWFVcW1uelJmQVc2SXFiV04wT2ZBNzR2?=
 =?utf-8?B?bEgvVmJBS003Zzlvc1Uwd1VpYytnQ1hNSEpNNnY4ZFFwSEJvRXAzMDA0aHVL?=
 =?utf-8?B?ZkhiVTY2SVRRNS9HNlQ3NnkyZDNxWTBTcFZ5VG1ESTlEMEdvaXkxOXJxZmov?=
 =?utf-8?B?cmRITjlYTlZ3Y2h6dW1jekVGbm5ybU5xNS9QRlBvTTNEZzVMU1hWcmFQMnBK?=
 =?utf-8?B?bGNBRUZ1NVV2azBxK05HNmhZRlJYRGZHM1pCOU5pT3ZpeWpUWmppaW9DVVdn?=
 =?utf-8?B?dktxZlR2MVVqdFYyTXFSbjBNY2VJMXhNSHdTSkhxN1hwSllKZFdxTkliNXhU?=
 =?utf-8?B?WlBaSWUxeS9ndTRueWNzTUp5ZUJDM3BBOWE5QkUzOG4vYWdvYmxkd2NjYlpB?=
 =?utf-8?B?TVlPVFc3ODcyeC9Bam5BN1NzSGcxbkN1emJnM0NhUGZ6QWdnckNlYnFCaWRM?=
 =?utf-8?B?Z1U1UXErYlJSQzRFS3E1MlQzOVh0MG5BUkppbGpSZ2NZOENtQ0JkditvUnFo?=
 =?utf-8?B?UlNsZktLZnhScmdTUitHL0RUb2gzMUZkVmp6RXpMUmNPajQrSnhsOXFEL3I5?=
 =?utf-8?B?YnI2YlNDRXZsZkczakFRZjdkc3JxdGZQTE1TdmZxYTlDYmNJRWxrS1pQalc3?=
 =?utf-8?B?MnlqZjA5QXBlNE1mSzVRc0d0cVIxZU5TRnhkUjRDQUVtcEQrckJyZm1oVTAw?=
 =?utf-8?B?SW1MVllZQWg2eXVlbFFsd211M2VXUnpNL1B2VmZtSlJWT3FKWjZyV3VBVFkr?=
 =?utf-8?B?WWZvZDAwWFQzbCtOSXB3ZVM0bDg3OVBxb3RRNHVoY0l2TTh5U01mZGV0cW8z?=
 =?utf-8?B?SlF2NVZLUTJmQmFTaXRHOGhQUGU1cWFtYUlYbDRRTGIzK1dZUmJyNlRLMTFH?=
 =?utf-8?B?a21RYmRENmM5dWJmWjJyaVhvMFFsa1RURGhzcDAvdUpkZk5yVUlnVG1KRTNv?=
 =?utf-8?B?c1VtNWs4dUMzYW93YXRIa25MWTFCY0lZUVVsOHc4WWt6ekkzNVI0U0I3ZWhm?=
 =?utf-8?B?akdsdTlJWlIyeGlVTUtLajNIV1A1bHQ0N2hoVUI0RjZ4NVJ4WGhZWk1hbkRj?=
 =?utf-8?B?TjRsNk5IYUtJQzE4cDhHS1N4Yzllby9DcjF0THZYQ1I4YXFXQU4wT0E2V1o5?=
 =?utf-8?B?d2hnN2pPWFZ6Q01WK3FaL0FDSnY0MHhBU29UT2NGSTBOREFVdG1uVjVnRmdi?=
 =?utf-8?B?LzJGKzZDSXhpY0xnb0VMdVVoQ0s3N2x1anlBMG93RHdkUXRpeDFScjVhK1NE?=
 =?utf-8?B?YXNnb2o0dlRGRFh1K3hxdnZKZ092N2gvemVRZFhDTGoya2lwbFdPVG9GWTZa?=
 =?utf-8?B?cXJmay9VUFlyb0Q5eGZTMWtwVXM0dVl3TVJFMEZ4dXR6NXJwd0gvc3JTNzVX?=
 =?utf-8?B?U2NSMisxUlhmditRczJ4SmlocS85SnV4cG4wYWFPV0RReUU3MjBmK3BLYXFP?=
 =?utf-8?Q?crF7onLm3pLAVOanNCEaRUs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ae4932-3bb4-488c-5810-08dbb5648c29
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 20:52:45.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oehPJJ3y9pPxe7j8L6MPMTeq0msRY7joq/Lz1c2BuxOmeic3lT4Wt70JX5z9QtPn7z74Hb0ybNU9OzRgcJi0KzeKY+HpbN2zZ5/ux5bNypg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6747
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/14/2023 11:47 AM, Andy Shevchenko wrote:
> On Thu, Sep 14, 2023 at 09:46:34PM +0300, Andy Shevchenko wrote:
>> On Wed, Sep 13, 2023 at 04:29:38PM -0700, Jan Bottorff wrote:
> 
>>> ---
>>
>> Changelog?
> 
> No need to resend, just reply with a bullet list of what has been done
> in v1 --> v2.
> 

Hi Andy,

No code changes between v1 and v2, just improvements to the commit 
message based on feedback.

Thanks,
Jan

