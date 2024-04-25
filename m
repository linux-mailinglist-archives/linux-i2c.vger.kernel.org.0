Return-Path: <linux-i2c+bounces-3180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB38B2D4A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 00:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67065B23E1E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 22:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F056315573C;
	Thu, 25 Apr 2024 22:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="FvwoHr8m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2130.outbound.protection.outlook.com [40.107.21.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344720315;
	Thu, 25 Apr 2024 22:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714085638; cv=fail; b=ESYhC5jpWdnFzXZOqOcDDxgFiuk0sPG0G1XMHiMq/DrlN76nOi+IkmkYBZ1Ht9CbevC0m0T3JF78jTaiDRmS1jAe6bRwZZlwK41+ISoZk4mvQncjPsTy9rSt0/21H7MVvshpHRtIee3Ec71nxtUa7XzsGXJ2ySss2vHbt8iYbcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714085638; c=relaxed/simple;
	bh=AHXKUNe3CXqWG7pQBMonfWs2I6++kPf36A8oOnZn9S4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ut+P67kgPDjimKQIOCNfevwKGyhp2gVTD7feQUfvy539s4y2re9vmInsnlSZfldmxN3o1Mst6if4H+GblGg3iBbrx18Wa1WTQ6VG2+8G+y5lLnUNLQ4761gEv5bcap4QGb7lv+lC87GfW73QbPJjW0T62WFAeOgsblwS0WewiHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=FvwoHr8m; arc=fail smtp.client-ip=40.107.21.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBEvBVwV8LVn3WEPoROks4wknAw7ZsDM/Oj7k8FGW9nSFpx5D0ziqa2cmJcgXWEJXeJX/PUR2ZrzoU8cI4aEX80hKI06eqF4DJc8q4ISWBh/R2adx3st5Ljfw7ejXMxqN/QchIcALi6UDbSqspHoaqV3/ldJYvYk4fLLbxcyCowOpudAt7uVnoHb7ZV5vIrPMriOTvinXoVLzWm3dr/lYuosGLHNyAizq+OkaSm9jDg8zAAsjSSEJxZ5+kx/w1wzFCMXVjWguuAdWJRnPgl3nlMjRLLyfrpIIJ6k2GRZsQ3q+6QV9NOJRx6I8q8lqvtMYNqhN5WkITDezQtNvBR2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgkpJP7yJjKKcdFOfgXKgmZ9IPZc20M7ug21RH/Dqf0=;
 b=cTit0mroDHKgHpuw7hiZhRRgU2DvKm9/LXBFMz6TPL1FXAfeiN0ic6hxmtqqFCTGb+r1ZNOsIhZQbM2Cl3ONQTYkncbZ3iqLwnbV63vuyo+XBUunhfTWY7wWwV+2wCmvAiBAN/OLjhsrTPZr5VXZKnrX8d0knx4A07Qni3dijnGMasdy4qp2hiCQGUn8grLs6keuZTD7OCubR76cqvMbcd4KQ0TNYnKVn/JiIZ8ewQWydqS6pKbCMdn5VAXigA16RLuTKdlHIsjxTpBkgXyVlN0bzM7bP8pDT47P+gVwjpvLYCfepHm0SgxkO1n7s2+/xwB86+k2Hk9CF53oSP3x9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgkpJP7yJjKKcdFOfgXKgmZ9IPZc20M7ug21RH/Dqf0=;
 b=FvwoHr8mVEe94MpFUcrZ8Cv68MS1vL6JXs04LFWpgeVcDuHXBKJFwyBCXGgCUXu6OlVndr53gj1lW2NcDvmpajPY7fJVxCxv1fTl6Op0UZQeTDH3p0nZlDa5X+M+rodLM6xYuxKRiZrBkSCcEB5RAGHKHV0rPLRGwuJSSQaWI0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by GV1PR02MB7796.eurprd02.prod.outlook.com (2603:10a6:150:1f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 22:53:46 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%4]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 22:53:46 +0000
Message-ID: <4a190b40-d2a1-8ee2-ee8a-ba07dee4d8fd@axentia.se>
Date: Fri, 26 Apr 2024 00:53:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] MAINTAINERS: Drop entry for PCA9541 bus master selector
Content-Language: sv-SE
To: Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20240425205719.2536971-1-linux@roeck-us.net>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240425205719.2536971-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::10) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|GV1PR02MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: de421e00-fcaa-4921-155c-08dc657a9072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SndBNXZydUpHMnFWWFdaUDNDRk5ncWU2QjVQYlRHeE5OcGRHV3JYRmZMczE3?=
 =?utf-8?B?YWllRmk3ZXhFY0lzYTJhL2x5dkVNZEVoM0w3KzVZaGV5M09uLzN1eEtXOHhs?=
 =?utf-8?B?YTVtNDFPTXZURVhVaGZzQzhlR2w1ZEFGZ3l3ZnBFOGdudGszbVAxR0NNZnlO?=
 =?utf-8?B?UWF1cTFuRXV2MTFJYXVvNHBRMHRDMkhYeFN3Ym5WL2hQRm1DWmhTbTJKdk9C?=
 =?utf-8?B?RkhkRkdoS3FpRzNKMUs2QXFJekl5ZThzdG9hcEVWZ1NJL1IrWkZPdUlkQ243?=
 =?utf-8?B?ZURnaEZ5QjBnT1YzejJiakNCblRPSXRIL0JCaFdTL2ZLZ3MyUFdIRHdYbTdm?=
 =?utf-8?B?aFprQ3kreXZSZDcrdUtKZ250WFRKZHJ3c0hxYmlKVnVrMEszL3ZlU0crZWZk?=
 =?utf-8?B?SlBZTWg0WSszdlh4ems0dlkvQVdUQm1GT1Fici9ER0N5ZWM3bHNCVjVsSHh3?=
 =?utf-8?B?aE1EOXRCVFFkVFU0TFdXTkMwQVlIZG1uTTRQbjdUc1FTenVKczVKNklJcSsr?=
 =?utf-8?B?aGlZQW9wUkVvUkF3aklRWWkxbjV6Q2YxaTM0NHBLc3Q0MUtkWjdBNW42YTBo?=
 =?utf-8?B?a1hpNE1Tcm1wM1ZJZ2xwRTRQOEp2ekFzSE1pU0FIdnFDL1MvNXJKU1MvbmY1?=
 =?utf-8?B?WTFjSC9ERFlyd1NiY3pLemZNWG1uUEErLzJhYVR2Y25ibjZGZEFEY1lSemJi?=
 =?utf-8?B?TEEybEZmWjdleDRiTlMvYVYwYVhxTUROMzhXTFRyUU1rWGFDcjM1Y0tsWHlO?=
 =?utf-8?B?UjBFRWh3LzUxamlaZVFjYkVjdzlNN0JlTlg4MmtTWXpUc1pwWDFVd0RObFp3?=
 =?utf-8?B?NTN5Y2tPYlZUTmFnV1B1RUxUTThLVThDVkxQN1R1THNlTXVWZnBkUUxYQXE5?=
 =?utf-8?B?YXh3elI1bW0rcVJnZTBjYXRPY2dEdWprbFZhZkRwNG9pRTBvbXpHK3NsWjdN?=
 =?utf-8?B?M0lSdzU4Wm5CZ2dpTEZIM2RqZGlQdStpTmlKVWZyZ21ERFBmRE56clJYSmR2?=
 =?utf-8?B?SmRPcWR6L0dYQVhBWlRCdE44N3c5Mk9ZT0dxMU5KU3J6aXV3M1VSVnh5MGJ3?=
 =?utf-8?B?RVUycUE3ODhLUUFqM1A0amNyVkNZdVNnOG56T1NTd3V2eXZmQ0pwSkZZZTBL?=
 =?utf-8?B?bm9PY3B5ZXJWNVhkN0FLWlFHdTNNRDhSQ053Uy9INkREZzlYZjJqSnpsSTEz?=
 =?utf-8?B?MjdDVTRxYWFrZ2ZOUSswYU9lbUUzZWl3VW8zSkx1ZVJpZmJtYm92SWVvL2RM?=
 =?utf-8?B?TmdXVkxQUDk2bXd3TXg4eFVjQUEzK0k4V3lvY1RqTVZaUjM0MHZpK3FIVzQ5?=
 =?utf-8?B?c05XMzNWYklkR3NLM3ZPbm5vTEtuODFDdS9naCtaTE9SN09mWjRzUU9SWmg2?=
 =?utf-8?B?N0M0dndGR3IvQTN6TUtiaU5KcDdlT0JLTkg1cHpNZE00R2hKVUdacDlBdHBw?=
 =?utf-8?B?VUV3WU4zaUpOQ2l1TUg2aUNoMGY5U3JhSmVnNGw2RUYwdEFKOTJYdnozNmV3?=
 =?utf-8?B?Q1FtTWhtbVhOT2xZcXNRd3c5ZlNEYTk1TDlwQnFwVlQ4cFU4Tjh0dEpUNXha?=
 =?utf-8?B?a2Rmc1ZRT1Bpams1U2lOOWJTYVdPd1FUaG8yL3hHZDlMZmJpSnpCdVVITHdL?=
 =?utf-8?B?bUZ5WXJzMmRGWGh6NTV6K1I3N0Q2cWN1Z3VRNWVEM2lER2FWMGNjSUFTMS9H?=
 =?utf-8?B?bHdNdVRQQVIrMjhYSUxIRTVBU21xdkVWVjhkZnJ1eGxyZG5ZRFM3Tkh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEZPNnVQYkZFTk9ZYjRNZDMzdGxlRnBCai9oS1JwaWQ1aXhJbE4wa2pSNWd2?=
 =?utf-8?B?QmJxb3NRTmE0L2FBNFhtZ3lwWExueHM0d3VERHUxdlBEeWo0SFZWVEFOdVlk?=
 =?utf-8?B?dVZXbW1hcVRrZkFCYTU2dUMyQkRkYWFkVGNCZVFsUnhsOHJMWm9uS1RrRERx?=
 =?utf-8?B?czN3dElyaUs5QTlndnRTNTVJUU8zSENRQ2VqaUFwVkw5VTVEU2xYOG9SOW5a?=
 =?utf-8?B?SlpEcDB3UldpeUdCMUhKU3IxTk5EQ05rdWhZa1d5cVVnOE56dU9tUnB0cVJa?=
 =?utf-8?B?TVI3d3ZtNE9vb2NjUUFyV09KSFA3KzVFZ0ZLVFhsa2ZSZjVqcXFGVE9XQ0lO?=
 =?utf-8?B?U2o2aGRmeVJDazBGYjMyMTBzaEZrMXREOWpyc1pmVEFvaXFCS2VIbGpKVEk0?=
 =?utf-8?B?RmlZNmxaVkFCUnQvc3duSTlSc0l1aThheUUrdUtwUTdHNUxabFU4dmM5dGp2?=
 =?utf-8?B?c3dZTW5UM1RlcEZnbFlreTBvNjZlYmJqSVR2dGplYytOZXFBaFpSTXNCRmRY?=
 =?utf-8?B?bFZNbGU4anp5K1E1Y3Q2UU02TXRJYlczZ0Z5cVhHRXZrVFRMVEduVEpmU1Yx?=
 =?utf-8?B?NEZTb3BYNzg4Q2RJdGQrMGxHdFFPUDRaSUJjZXFIL1dKdzN0TTVXbTBObitx?=
 =?utf-8?B?cDB6RmdhVmNnemtZWHFsbkxJN3JJQ1JGNUFROFZmMStQKzFscXluS0dJSVRl?=
 =?utf-8?B?SlJZTlUxZVVvRDJISjlaV0g4MVFBZDhXSGZVTUV4a1A1UDR5V0h5SDF2cHFF?=
 =?utf-8?B?NDZQUXZ5MVl4VWltU3VwTGVUaW1vcGhpZW5KbVZ4RzIxaEJNWEdEa2NHZnJp?=
 =?utf-8?B?K1A1QVNuT3ZhNEJ0WVZwa1pGbU1EbU8xck4xRVlZVG5ySDVWdnhaNjM2Q1c3?=
 =?utf-8?B?aTByc0pnYkpPbUJSbjJwTGFSZEVjQ3NXVGVOT0JMc25TdFNBdWhRTW8xbFNH?=
 =?utf-8?B?SFpsR2M5aElWZXNzdlVodmt6VC9EMnN2MGR5LzBIb2NXM2VEeGY1anloYmdQ?=
 =?utf-8?B?RFNERDZ1M1g0cnI5Ukt4eFU1VHUzeStZZnJ4RmFHVHFDdFVYanNNUXNsQmZF?=
 =?utf-8?B?YUFtOVY3MkRtY2ZzZHFuVGl3SFJqL2NyQ29rLy8vK1dZN3Y3b2FqMTd4YlpX?=
 =?utf-8?B?UzlnNEM3ZVpXeUw4K2NYQUh2TFZFYWxWbFA1emdTTWpEL2pkdDlaSS9qZFhu?=
 =?utf-8?B?WldNcXZMMjA0dVpUTTJUbGlaeVozbWl1VmdsU0xNSnBuTklOdnAvVXFCN1V3?=
 =?utf-8?B?MVVNL1Q4YWRLL1BkdFIvNVVRcDRaUSt6am5MNmdZTkUyMUgrdU5sTTZPOXln?=
 =?utf-8?B?b1JJTzlaSTNXTy9aSytlbnZFSEdtL292Slc0ZWhleEtWR0dERkN6SS9Jd2Za?=
 =?utf-8?B?L2FqRGJmenYvQ1AvSjRlY1pOWWtNemVyTlFCMUh1bjdkNm9ZYTFzMGRvZ0R2?=
 =?utf-8?B?NldncFh6OFQzMnVSL1pDbUM2SmVkejRJVmZZM09yVlhIQm5hbUJWc1orVWhQ?=
 =?utf-8?B?b1psekVwaVdmZklja3BINFU2YWg2cG5SdUJNKzZTM3lJd05INE85YzY1TnRn?=
 =?utf-8?B?SGpBdVNla1pSem1yZXd4NG13UFl5cGp3MkhrTGVNL2RkQTlWa1p3K29FQTVQ?=
 =?utf-8?B?OE0vTWxRZXh5MTlIWDZXbDNhZytzOGs5eTZyY2Iyc0FCZjZXWStzRk5WeTQr?=
 =?utf-8?B?R2tuT1RLRnpjWE1xRDZLa1J3SjlxenJ3c2FmMk9ETlFZZTJLYVdxM3lCTHdF?=
 =?utf-8?B?bm1XdklNV3ZBVmxUZlpueHBQaDFzUjdEVExmMVB4VS9Nc2ZaQUtwbVduUXFB?=
 =?utf-8?B?VEF5YldyeDZ6L2E5WTdpU0orMjRJTE1rVlJhUWptU05RMjVzNVZjR3d3MVVz?=
 =?utf-8?B?UGc2am5wWEk3QVhRVURHNFp4QWZhYjk3VFdCdXR2VUp2cU9YRjV6ZDJsdkYy?=
 =?utf-8?B?emgxRnhzWkhhT01remtsYkNOV2cwNlBqdFczT1hPVWFvT3IzRU1PSDVnSVcr?=
 =?utf-8?B?SVFISDZhczZ6azg4SHNYa2F3Q0JYZXBvV1dQd09mdU8vSUxsdm5uVnd0Y3JC?=
 =?utf-8?B?K25lNmxicmdGRENUK1V2Z1BmSGJuR3FQZUE3aWUweHBzbjQ5TzdaMVFpRDJK?=
 =?utf-8?Q?UsCzR9GjvKpiHHe4jwoWbRodS?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: de421e00-fcaa-4921-155c-08dc657a9072
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 22:53:46.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygtIWVINvbgGBMrGYSJtNJ1afx0eWKILo9bo5i7uEC5q4x4cuB12hJ42pD7X2Dbg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB7796

Hi!

And thank you!

2024-04-25 at 22:57, Guenter Roeck wrote:
> I no longer have access to PCA9541 hardware, and I am no longer involved
> in related development. Listing me as PCA9541 maintainer does not make
> sense anymore. Remove PCA9541 from MAINTAINERS to let its support default
> to the generic I2C multiplexer entry.
> 
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

