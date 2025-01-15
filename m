Return-Path: <linux-i2c+bounces-9113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16DA122F8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 12:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF7C161078
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2025 11:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145E620F999;
	Wed, 15 Jan 2025 11:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UyjGuZkG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE6248BB6;
	Wed, 15 Jan 2025 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941575; cv=fail; b=S2/IvsZgK0WMy0sGXIat531fLom4pRYnAbltoyEoYYIkuQN7LWY82LWlG4M8j/xbYTI5JSEYEfmlfZDDkiFm7frjEkivFjZBLaZyhX/zBuECM4bH8weYdEdzRmN6Hx46Ktf0DznzXqcHUBqRMQQTHMXtfDOIl9oaevcDmeEXRSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941575; c=relaxed/simple;
	bh=Gk0BG95TNfkmrQpgSy/OxOqCvY9b/LO8R16apOWBfiE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gE6F+2OIcTzyaS9ERMcBkXNolDZxIwNxBxe2MVXvU96ag/wDSrB2EdTBly1bHUeLgKG6dnabVMEaDOAvCfhZp87qm6bDh0s1FmIifXC/XudW/MJvJYORF6CkOoQXxRvGNkBTuX2MlT3TBbjEhNWu+hoJJfW4zDE9y2TdbJ7sUr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UyjGuZkG; arc=fail smtp.client-ip=40.107.93.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy7ribduFhVjwMU9BU8ODC7uL3pJ0vjKGDSlOEn+lnMYXp2D+HozEJDU/3TLZmTu0hnDRZfCQfK0D+BbvbJNth9wkQDoQWq885dO9+enDZuMfr+OUyYLwGdpBN3EF8ym6YFFXtQVoeq/8Wor98A2XitT8Fsp1ixCXvL4vZ7ftuCHfmiUqS4uTBy6vVLhUivAIY59+XEAGSZY+H7lfnGOqttuwAwAJ5BV05gE0W8QIsiOu4Jzth49WIHRDc1chpbd+hqtrGCgcQ14NoTReQRdQ2ihbXqOJflDosQNY3tvUwHjxdFSO2X1ucT2MIQnNYr5fcODRLAU44REwylj12CVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk0BG95TNfkmrQpgSy/OxOqCvY9b/LO8R16apOWBfiE=;
 b=E1eqKjMjeWBKRUUA//6cPPC3zJVp40QSFVjUT/SUCzraQ45snpclRciuG+8+iZZiNrkZrZTbFSiMdLfJYN8HZ6fRtfdFqZAioCSZkmRiZ+3GtqcVS9H8/Sw84K/mR8dXU5m9fgRTpJgx3ZUXmauYmRI6fWEJ0hnwia5h1eteezHtVU2IiCjG5FmHVnThXWi3ag4VlZPbPpOIQZy/elJ3A6dN6aqqYX1PoTQnAG6CMYL+LmzRLOHcyG/ZYPOBzDg4UUgLVhigpWC5uccuuWz4YWIz+oavUPv5AAPPcP004O+KFl8N1NztsjNRZb2uR+NErQAfHDhDXzteATIkxJNHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk0BG95TNfkmrQpgSy/OxOqCvY9b/LO8R16apOWBfiE=;
 b=UyjGuZkGHCg8LwgSI8FuiTIcJ653EuGoCnCGpSSgFYu+vgi9VzJK1JjDJB8oAEwotXg1WQhxqdF5VPTs7SYCv4jlNMwxACufsW6g8ltKqSP1705onr4QI5qRvvRO/XVNSCVH6Fy69DnWB4RpP49XW85bPa/Z0g5UpU1EIemqxsvLuvFz5IGlZCCl/hTH1IjkVwXDixyRlBgixr+ipNftq/jHQA9WhiiMH9cQ12xNGbxqRiQa7Gshs87rmyNof+t23HEmhplAX6N3Jkoa0yA6VMkRSv0GIpd9/7x+z2EPkP8UoF9E48ZdMtMjUWs6hxYu5UieXfeneaRs6c3dZGbBqg==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 11:46:12 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%6]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 11:46:12 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: Laxman Dewangan <ldewangan@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Akhil R
	<akhilrajeev@nvidia.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "digetx@gmail.com" <digetx@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Thread-Topic: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Thread-Index: AQHbY3gGSkwmd+clk0qB4OpVv0I2lbMXvy2A
Date: Wed, 15 Jan 2025 11:46:12 +0000
Message-ID: <741475917f255c943002ab8efa7def30f038d2dc.camel@nvidia.com>
References: <20250108110620.86900-1-kkartik@nvidia.com>
	 <20250108110620.86900-3-kkartik@nvidia.com>
	 <20250110155509.GA2935916-robh@kernel.org>
In-Reply-To: <20250110155509.GA2935916-robh@kernel.org>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: e65501a7-6bb8-44a9-a8c1-08dd355a35b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dldyaitzZ2IrcXZudkpYb1dabHNmSldjNDljSjJOOUtWRCtmdjk5T0dUVFpp?=
 =?utf-8?B?VCtVbGhCanFtajJhVnhIZGRnVG5lSGZubmliVUNuNkRJampjeUhpcUE3MFg4?=
 =?utf-8?B?WDl0eGt4a3crL3BrNFIxUkRxTU51S3NMVlBHWERtTGxuNzAvS2I5Z1hieExp?=
 =?utf-8?B?anRXb1Q5aDlNYjcrME1SSjNISHVBRGZiRnJtYnpiekVDU3l3RTZ6YzA4TjZu?=
 =?utf-8?B?RW5pcWZ2SXhySTZtOGZyYmZRYmpzTnFkbmJHc3Z5eEJIcVVieVJrMlBtOHdm?=
 =?utf-8?B?NlhhM3hKRkZIUDd6QWJrODgxR1NUN3ZPOWtkVUdFSnV2dmVXMUNtRDNJVkE2?=
 =?utf-8?B?Q3hxWXJiWFFsSkd0TlRWb0g0YTRDVUVZZXdkOURRMHc0ZGJXaGtQSXkrT1l1?=
 =?utf-8?B?cm8zb3ZUaElIaGUxUFl4VjY4NllKaStKbXFFVkRmMFJ6djhBSG5PYXVQYlFF?=
 =?utf-8?B?TG9lZUYxTTZLWjJXQzBaUU1DOTVGTnRjcEdVa2Npc0dEQ0FZTnMyZDRaS0R0?=
 =?utf-8?B?QVlHREcxMTkxZWt0YVhTaTlLQlJHY3VmbGVFN3dQUTJSVm9PL295aTdkb0RU?=
 =?utf-8?B?WWdQMS8vRGgyTFFnRGhSMGZEaWVpUksrejR3NTNmQW5Ea0x2MFhOYnA3Snk0?=
 =?utf-8?B?T2lqZjREbjhwSFl5TXREM1Y3TFBZaEZ0cnpCQ2p0cHFwME12Rnc2b1RnMG5J?=
 =?utf-8?B?bk5pRldnRS9CZTNYcXVTemxCWkI2NFc1bm9wbmtlaEJ6bkFua0VKcEFUVysz?=
 =?utf-8?B?TDRTZE83Zk9IQk5lUmNmOWRVdDRzazltMlFmZWRwcDFoSlF5N2EyK21kU2dE?=
 =?utf-8?B?SHhIblIvcjl1aStuRGIvMGtFWm1ERmZ1V2g5ZENrTnByang2L0JKSW51dUZl?=
 =?utf-8?B?c3JZSmpmUXBoR3hrdXFNNjF2WmxoYTN6WTljNEVnYUJMeWdobUtVVzd4cVJz?=
 =?utf-8?B?bnU0cGg5cFpGZ1Yvdi8wTzAwNmVzVi9zY3FERnRFd2RvcVNOUVpTM0FrZnNO?=
 =?utf-8?B?UFlPb0hLd3N0ano1dkZDNWJiaXgvUHFWSWJNd3RWa0J0bEJhcFM0c08vQ1BK?=
 =?utf-8?B?VysrdFlYWW81c2thb2I5b0hwRHVjU3pmdE9vVnZLK1ZpZStTUGNsNnpVY21U?=
 =?utf-8?B?U2xvSWhsT25RSkN1d3R3YUJuMFBaOHlsaDdkTVdIVTJ1Q1dXYzZVNkIvcHo3?=
 =?utf-8?B?eDkyUEluY1doZVJmdStDTmdtWkFvYTlncmIrcVZYQnJlMzl1Q3RqL1o5ZWxv?=
 =?utf-8?B?YmZGNWZYMzhJdkxxZWluYXJ0TUJGME94UHQrZWw0RUVVZS9nNEQ4Y1JURmdN?=
 =?utf-8?B?b3IyTEpFUkh4aEF3cUxCYUw2TkJ5SnZ2akY4U2RUSnhKSnd5eDg1L2EvS2I5?=
 =?utf-8?B?VXVyWDZVN3NzM2RFYkZUaHBSNmJhciszZlRHeEFMMTMxVzRiUDFpRWMzdmtL?=
 =?utf-8?B?Q1k5ajRBTVpBcVBLY3lOa05iZ2lIUkVScGhlUENJRWFQbHF4bDRNOFJDTjdx?=
 =?utf-8?B?Ymg4VGNSNkFGdzYxaGZIU2M3cXIwb214eFNiZTgzdndMRjBQa2FNalRTTDRP?=
 =?utf-8?B?SHljaWhDQVpnK1Y4eUV2bzNzaUl4eDJwQU5Pb3hYSi8zSE1OR25TY1FaVXg4?=
 =?utf-8?B?THBMeGtTc3VjRjJpb0l2VnoyTnF6ZE5TS2FQMjYzZ1k0QWVpa0FjV3VhS0Ir?=
 =?utf-8?B?QUJSUzIrYk5mcDk0bUFIc2tFbHdPUnFKUDh6T2FqV2NKM2s1ZXdNUU9kWlM4?=
 =?utf-8?B?STNOSUJsWXdmVWFBdElXNk1SNTd3Vkk5RTFvNXZieWtJTDIvK0YzNWhORDZH?=
 =?utf-8?B?Y09pejdSTkFsUXEzWXkrZVIvai9wdmt0K0dQbXE4RmRkK1NCNTBpUlh2eE92?=
 =?utf-8?B?MHo4RFQrK2lheFdwMHp3NFRManBqU1l3MFMyMkV1RnhYRmV5OHJHKzIwT0VJ?=
 =?utf-8?Q?G9GutTPfOIy1xrvIlesUGigKKr3gQ9vJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUk3WTFWcVExcXY1eEdTRU9hNktlS2VFYzZCUkVqTks0bndHdzE1T1dVV2to?=
 =?utf-8?B?cDQ2NUNURlFFNkN2UVpjK3A0MkNJbWhtRi8xNmhwZ0tzTWNCZ295bmlNbnND?=
 =?utf-8?B?ZGNCNlFjMEZvUFFkZGZNWWtYQTkrMkIxTVk1KzQzSjg4V1ZwWkxldVBpclIz?=
 =?utf-8?B?WUNmVENTNE4xMnZrejkwanBsY0xIUlhyOUN2eHRPYko3WVpYQ2NZVnBRQk0r?=
 =?utf-8?B?OU9Nd1VRa01lV1pSOUNsZVc0Yll6dE9nZGpySS9UTFVqQVRCVi81VkROTGRm?=
 =?utf-8?B?bGtXL3dPL1ZNbHc5Zkk1YVBjZzdFeHZxcmM0N2JBbHV2S1hvZUZzNEYxUG1H?=
 =?utf-8?B?V0k4UTJrZmVQT3diMzhEVmJqYU5LNTZVYVVNcHc3cEkwdjNJS3VuS2NjS0pu?=
 =?utf-8?B?Ty91ZHpBMzdzMktITkNuSkRwRjVIVnVkS2U5Y01uZTQydHJueXhwbk14cXVh?=
 =?utf-8?B?b3dQM1htY2JmMDJ4c0I2OXhUOXg2ckxTaWZhYk5DUjNWdW5IWmRJMTN0NUY2?=
 =?utf-8?B?R0pXVjgvYTU3ck5oZlg5YmhjNyt1cjlOUGM1TnVDUUY3a3N1OW96aHNwRUlu?=
 =?utf-8?B?OERackpTQ2tKSzV3TUdKL2lodzY0dWVRM3pLNmFPY3JxUkVGcy9PWFdQMEhS?=
 =?utf-8?B?VlB2dTRqWU02NE02aitvSXZmUkl3SUIvL20rUTNkMSswRGtWM0xMajNiWWZh?=
 =?utf-8?B?OHErWUZUZlRuSDlQQ0dGdURtV1psVS9jbG9PZFc3ak5EQjFMYzVlNjdMOVI0?=
 =?utf-8?B?K2U3R0xVRWxBM0h5SWVyTGM1TjV0aE5yUWprZEFHYnMvT2JXWVo5RHpvTjFq?=
 =?utf-8?B?L0I5cnZRZGR3K25xSi94SUVnWkV0VEwxU01qb2IxRGxWMk9OOVh6bWl1MGFp?=
 =?utf-8?B?aVJaeGdaME9KWC9IV0dBaHFQSlBrMDR6UFhyLy9sNTRRbDVqOUNHcExkRHBY?=
 =?utf-8?B?SjhDZE1oUUJyWlNYbGhjQmpoNCt6VVNuN1Nib1Vyek1mMXZBcGFiazYrTkh6?=
 =?utf-8?B?SlN5UEYzV3BpSjJpVEdXSDc5VGFrUGE3dmRSclF4RENKTHF1R3VCS2h3WnI1?=
 =?utf-8?B?VmNZTGt2c0lIQ0M1VHJyMzRuSDNDNGdOLytKakJmR3FxNGQ1RUFpc28rSzZ4?=
 =?utf-8?B?ZHU4M3gxdGNodElhK2ZBcUlycWsxYmlKSHI5Mk0xNFJuQkpIaDFoejkrTURx?=
 =?utf-8?B?Nkg0NFJCcnZVb2d0ZGRoZ2FrOEZtNmE4SXovNlA1WHJJZWtTbktSOGJrR3Ja?=
 =?utf-8?B?QngvNFFUbkcxb3pQL2loZW83c2xndnlxZENhcHd3VHVrZWpWY3owVnZiMXE1?=
 =?utf-8?B?WGZTdmVJYXJkUXF4WVdUZzJuOW9lUlBOMzZDYnlzYTZQS3VBdm93VWFUclo2?=
 =?utf-8?B?bUFWbUxReXBTbWIwYlJMRDVaLzNjQXlPVnBtTFpFVzVPTk1hRHdQMHY4VHFm?=
 =?utf-8?B?QjZnN1gzQksrMlFiSWExb1RVZ045NHJkVlE0RnB6V3ZjOVpudmFRQVFzRU1Y?=
 =?utf-8?B?VUI3VmhOS0NnQjlIdDQxVmRsYVY5eXluTVpDYmladmd1V0xXVDVSS1dtRlZI?=
 =?utf-8?B?cGZhZ2NTYTdrYmRMam1QSHFRTFdrRnBYRCtlUCt1S2w3aDhXeWRVNEJFR3Ay?=
 =?utf-8?B?OTg5djZPb29zVGNxWWY3SmptUVQyOW5RSlMyRk5rUE1vZVFOSnQ5VGU5YnMw?=
 =?utf-8?B?bDBRTGJYQVFFUnZpRWJEUjhnSTZTeFpLa2g3bHFTeFpXY0NJMmpGNnh2YzE0?=
 =?utf-8?B?OXVWNXFkaVphTjE0REtBcXJ4SmNXdEhXcDhyaE1yWi9jRVRrTzFPZXdoRmhH?=
 =?utf-8?B?OWEwbVYxU2daRVJoeGI5bjBqQmY5Rk5YMk80T2F4ZkUzVkJibVIwUXZuakdn?=
 =?utf-8?B?akxpMjJWb3k3SE16aWpzNGpWNHVKSnN0U2E5UFMxRmx1eVkwUGkwT0RsQWkv?=
 =?utf-8?B?QjJ6bjB3b1ZDWmJxVm5kQjA0U29kdVg5S0dtSTFpNjdtZjAvMll2L2Z6VnNH?=
 =?utf-8?B?U00xcGozZnZiZHpSSDRzTmQyTG9pMU9TWlZncTBLSnZwSnNSL3Znc3hYNHVk?=
 =?utf-8?B?TjNtbk1zcml3cUxNMURSTmdEZWtUYldGRFlHZ1RJeWtsN1FjQjZnc2lIT3ZU?=
 =?utf-8?B?bTJ5aWdNRFBTbDl6LzdzUTdIbGdlaTdQNzBKc0FFRmtGamxJZTl4R0lqSE1F?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED1EB14EA8503843AEDF18CCA25A4480@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65501a7-6bb8-44a9-a8c1-08dd355a35b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 11:46:12.1063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yNJgkk31UmsP4n80wkxpBWNf8/4JhcQKp3v2EDAq48stvYHyscfmjP/xv1UyscP1DLqrdIbnAsEcG0RzS0qWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249

VGhhbmtzIFJvYiENCg0KT24gRnJpLCAyMDI1LTAxLTEwIGF0IDA5OjU1IC0wNjAwLCBSb2IgSGVy
cmluZyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mg
b3IgYXR0YWNobWVudHMNCj4gDQo+IA0KPiBPbiBXZWQsIEphbiAwOCwgMjAyNSBhdCAwNDozNjox
N1BNICswNTMwLCBLYXJ0aWsgUmFqcHV0IHdyb3RlOg0KPiA+IFRlZ3JhMjY0IGhhcyAxNyBnZW5l
cmljIEkyQyBjb250cm9sbGVycywgdHdvIG9mIHdoaWNoIGFyZSBpbg0KPiA+IGFsd2F5cy1vbg0K
PiA+IHBhcnRpdGlvbiBvZiB0aGUgU29DLiBJbiBhZGRpdGlvbiB0byB0aGUgZmVhdHVyZXMgc3Vw
cG9ydGVkIGJ5DQo+ID4gVGVncmExOTQNCj4gPiBpdCBhbHNvIHN1cHBvcnRzIGEgTVVURVggcmVn
aXN0ZXIgdG8gYWxsb3cgc2hhcmluZyB0aGUgc2FtZSBJMkMNCj4gPiBpbnN0YW5jZQ0KPiA+IGFj
cm9zcyBtdWx0aXBsZSBmaXJtd2FyZS4NCj4gPiANCj4gPiBEb2N1bWVudCBjb21wYXRpYmxlIHN0
cmluZyAibnZpZGlhLHRlZ3JhMjY0LWkyYyIgZm9yIFRlZ3JhMjY0IEkyQy4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBLYXJ0aWsgUmFqcHV0IDxra2FydGlrQG52aWRpYS5jb20+DQo+ID4gLS0t
DQo+ID4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbnZpZGlhLHRlZ3JhMjAtaTJjLnlh
bWzCoMKgwqDCoMKgwqDCoMKgIHwgNg0KPiA+ICsrKysrKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL252aWRpYSx0ZWdyYTIwLQ0KPiA+IGkyYy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9udmlkaWEsdGVncmEyMC0NCj4gPiBp
MmMueWFtbA0KPiA+IGluZGV4IGI1N2FlNjk2M2U2Mi4uMmEwMTYzNTkzMjhlIDEwMDY0NA0KPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbnZpZGlhLHRlZ3Jh
MjAtaTJjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aTJjL252aWRpYSx0ZWdyYTIwLWkyYy55YW1sDQo+ID4gQEAgLTgwLDYgKzgwLDEyIEBAIHByb3Bl
cnRpZXM6DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3VwcG9ydCBmb3IgNjQgS2lCIHRyYW5z
YWN0aW9ucyB3aGVyZWFzIGVhcmxpZXIgY2hpcHMNCj4gPiBzdXBwb3J0ZWQgbm8NCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtb3JlIHRoYW4gNCBLaUIgcGVyIHRyYW5zYWN0aW9ucy4NCj4gPiDC
oMKgwqDCoMKgwqDCoMKgIGNvbnN0OiBudmlkaWEsdGVncmExOTQtaTJjDQo+ID4gK8KgwqDCoMKg
wqAgLSBkZXNjcmlwdGlvbjogfA0KPiANCj4gRG9uJ3QgbmVlZCAnfCcgaWYgbm8gZm9ybWF0dGlu
Zy4NCj4gDQoNCkFDSy4gV2lsbCBmaXggdGhpcyBpbiB2Mi4NCg0KVGhhbmtzICYgUmVnYXJkcywN
CkthcnRpaw0K

