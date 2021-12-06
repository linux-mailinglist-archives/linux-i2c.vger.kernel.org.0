Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E33B46A49E
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 19:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhLFSdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 13:33:39 -0500
Received: from mail-dm6nam10hn2210.outbound.protection.outlook.com ([52.100.156.210]:3425
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230448AbhLFSdi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Dec 2021 13:33:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCmkwJRiME/15tpaFR2SZiFkixYGZMikarUXopfBbHrr8K/bGMNIlMXs5pU8dKfdMrtjBUS7Jhk0x7NxxUaw/SH48l9UQcwZIv/bHD415HpIs8je8GoV/2bhtrAln+SzV/n1cHN+7k1OWuK/aDmcweL/gNvxuwKpU9oZkh1WFbptyWLL/pX63dAZWteAYHP8eHCj0/WynWDmkVV1DDZxoN7bqojpaPdND/B8MvzZnu+29gHVcGTwxLYXqFyj/KHZpzXgv+LLsZbH37M5QUxj9YzfM4XocUcFei8u4UdLKtMecSxMQxrksGKLw/QQtiBXeHEXqVdh6g6lsx5USgmwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=D3mxZUNfofYRJoFX5RqL4Y9z4GnpkCspu8WnBOii/lac8VL2drKsItX4FB0uu58Jrgd8EhDwXzplktWu0nhhbsdzAGSFPF65L6Ffi2kd307grkM4V6539xivS7Kolime+hwfAh/Fm7SMfirbY5uDmkte+/Kxlf05jlmtzM7zKiKFxu3ShRC7cynjQkXzmaYDVQP3iI2e1/QyYw0a8jM/KyAEUWb474UmXbEdTsG8XNncqQQ9lLc8oJA3wZT8lU2L4TDLEm0shMcLBNkbTJLSTrlTr6fbZROlXAkFoCmlHr0fHDs9vGEWQPIL+d9dAj8PoEBwpywuiUC+7dLojLgzbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=sbcglobal.net smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=ZvLjAeOFfs/mm1ouPEOyMDwrGCXMRC4zvttMbY67MqMuETj1egUf5sU2FW72B5BxApdr/L9g2zJ2UcfJejtkdRLFXLLWjZA4ZWsLSsbwfedl0RJro7cKZgySiR/DY/hPfNW/DN0nQmpe1W1gKnHLG8oHxGGMQrlpgZdljyuhVDU=
Received: from DM6PR03CA0012.namprd03.prod.outlook.com (2603:10b6:5:40::25) by
 PH0P220MB0620.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:ea::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16; Mon, 6 Dec 2021 18:30:01 +0000
Received: from DM6NAM04FT012.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::3) by DM6PR03CA0012.outlook.office365.com
 (2603:10b6:5:40::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 18:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 DM6NAM04FT012.mail.protection.outlook.com (10.13.159.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:30:00 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 9E06295189;
        Mon,  6 Dec 2021 13:29:25 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:28:43 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <545b362e-3afb-43e1-88e8-23b184412e28@DM6NAM04FT012.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11837547-7371-44e7-b9f1-08d9b8e669e8
X-MS-TrafficTypeDiagnostic: PH0P220MB0620:EE_
X-Microsoft-Antispam-PRVS: <PH0P220MB06204ED450006FE4034D054BEB6D9@PH0P220MB0620.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(86362001)(47076005)(9686003)(31696002)(70586007)(2860700004)(786003)(70206006)(316002)(356005)(6266002)(7596003)(5660300002)(6862004)(3480700007)(82202003)(31686004)(6666004)(83380400001)(40460700001)(508600001)(2906002)(8936002)(82310400004)(8676002)(35950700001)(6200100001)(7416002)(7406005)(956004)(26005)(336012)(7366002)(7116003)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTFaRTA5eTZ1UGVvdDQ2b1FWUnhpNEF1VWJjZ0JwVXZBWFZ0eFdCNXVDNTVu?=
 =?utf-8?B?aGZweUl2M0xjRmdza1l3dkVpVUdKR2xXRm5uWFg1U1BnWVc4a052OTNWNnRa?=
 =?utf-8?B?VjUyMTIyYUYxOUNMbFdjTUVjczA5Z2NQNmRtVVpFdTdzdnp4VmI4YjVFaFFv?=
 =?utf-8?B?dlFUanJjWGJVVzZDMTJIWkhnV2lXVkxYbmRwamV0NEgxVG15TkV0ZTcxd2pS?=
 =?utf-8?B?NTVFTkF1ZHlaMTdNMUdTdnJSU1k3bkdUT1VMQnk3MkQ3M3pLeXJEenplNG0w?=
 =?utf-8?B?NUJIYlJDTGNOdEhldGpuVks1bmxZS3gxdkhBU2pXejRuRTFqRE9CWXlDaUgy?=
 =?utf-8?B?WGJueXpxekpXRjl2RlRqeVNLMjFGYUQ4bFU2TFV4U2xhNWh2R0RQY2Rva1V5?=
 =?utf-8?B?c3hYRzRqQlVyZW9ENDBVNVh3dDR2ck1lR1A2SHBDa1RxMmtzVzIzY1lXZW1v?=
 =?utf-8?B?U2hlN0l0cnpXUE52THlHMS9DeG93WEJCK3BkQmhZbHQ2Q1hRMy83ck03dzBS?=
 =?utf-8?B?OSt6QlhkWTQ1SU9NMmxmalRuNDdQVXVjTTRIQjVVTEpyTlh5U0M1YnB1djZv?=
 =?utf-8?B?MUhaMjYwLzJmSEp5ZjhCZHhDZ09IR0VVajRhZmxtd2g4TW1aV1luQkpSOFVV?=
 =?utf-8?B?Z2NjZXFndnhvOGgwRDlBUEJCclZHMlhsVGFrYlpDd2pnaW1KdTBnTWFFSmw0?=
 =?utf-8?B?WWsvakpvcnJNczFqN3duSVFzZDIvSitVeTBaK3BQWnQ1ektzcUphRS9QRDFE?=
 =?utf-8?B?L1VicUU3amdsZlArWUtuOGVRcFphK2JjUSsyMWhnVkpsdTNyMWlNOHFab3du?=
 =?utf-8?B?NWdvMS9vQzRDTHhCMEFWcG51RC9vL1RSL2RlTmcvb2V3ZStMM0NKY0NNUjZW?=
 =?utf-8?B?SDJNMU1jWm42MmFOY1hZY3RlZHpxVlBoQ3NjU08wZTIzVHB5MUk4Y0krcWZy?=
 =?utf-8?B?Z2RoUER6SGtncFRRM1N6M29DQ21hUjRhWFpPd2NxNnY0M3hhYzlVYkpySHFK?=
 =?utf-8?B?VEZna1NiRjFVWnAvSDhOV09YTGhmc1RCNjc5WTBLNmhYaUQycUNCUDBlczJk?=
 =?utf-8?B?USt4M0VraUNWUUdJTmZJa3d6dzJwYWdUa014ZUEzTW9OaGs2RGNVMGo3UGtr?=
 =?utf-8?B?d2Zsc0FYZ0JFbEtySjEyRWFRMkN0eGhOS3lXMVd6RkE3SkwyUWZNM3pLQ3hN?=
 =?utf-8?B?dlZZOTJPZzNpWXZlSlVHSVNiN2dSZytHcTZaNDVsTDlHS1c2THRXci9NclVY?=
 =?utf-8?B?S3liREpiU1V1azd6SFc2NnJZNHJhSTdoQlFGZVVLSUFpSXRmdWhBdDFUMHFy?=
 =?utf-8?B?Ry83L21OejBWc1B1SjRyZHVJdUxyWFZNaThQTmhwaGtFalNJbjQ5ckxTUEJj?=
 =?utf-8?B?dFpNRVNFRDkzK3BMQURyVERybXNpMXRPVDRXd2ZEaDhvM3JDUGJ2ZU5MTkln?=
 =?utf-8?Q?fg6TQLuG?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:30:00.7234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11837547-7371-44e7-b9f1-08d9b8e669e8
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM04FT012.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P220MB0620
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
