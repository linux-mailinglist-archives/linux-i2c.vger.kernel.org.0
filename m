Return-Path: <linux-i2c+bounces-11199-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2344ACB5E5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 17:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7358D3ADDAA
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Jun 2025 14:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4842D226541;
	Mon,  2 Jun 2025 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAxy1bKd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD30225A24;
	Mon,  2 Jun 2025 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875741; cv=fail; b=ccVJV3F5d01STigKX3QzVifyl2XEg8CElDHax6FRvsvFgq2xVhIiT7sH7ABSbFwUh5NMpFyTQhV0NtgrJf8msWiBFy6Gk3C5PdyKmREGd0EuCuigASPQo9xJWAcqhjTbFHowB4rTGD8ZvS8gkVsVw9QgSEOVfQobFpUKNNTD+xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875741; c=relaxed/simple;
	bh=yIRy6UbKME/A+uPoTlel+YaYaXJjMOE/OvKUObwIOGo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G6uaI8rwGkJJumnSmX8UpbkOUjX8X+669uvAXiHcNsgBK5qCkl1p2un3vEFynJKYOiHPrSzwzezf7LPMhwaPTGca0Z7qEj3M8mvhbBm23YGuvf1pTzO7MyYm/FeNb0uUWBkPwK9YnAv3Q5J9g78UGm99G93HaLLU0ZvmXe+9Vig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAxy1bKd; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748875739; x=1780411739;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yIRy6UbKME/A+uPoTlel+YaYaXJjMOE/OvKUObwIOGo=;
  b=cAxy1bKdrY2yubHNe9DNwA/IAh2OUStWqMCRg031ucFYq+dJCP2AQNda
   O6gcD0d7AM6TZWI9DD2QXNA3FFd6L7qjRNZuoNciaGL9j6gh2z9JJcHNd
   sfsyWvf30zPno28nWDqpextZx+tHAnARap7yO666Rttzshf50djQFjVxd
   JqlabdVX/rUdc8iMDuh5LYpCxpNpTHcvbdrG8h8cQ7uedNgxHExpafrcv
   DbVLxZH7hZkf5OyT54MDR9hkaXkJXzHttGqs2O1SRpJaPnK5T8rem1NuP
   aJTOViNfxLZct31PkMFSTQ83PTxrQSSto9tyECIJGvcQ4OpYefVd7NyTo
   Q==;
X-CSE-ConnectionGUID: a+jF4QHcQCyNgdGZxENYoA==
X-CSE-MsgGUID: BjY4U9TlRG+DHptB06++/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50008483"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="50008483"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:48:58 -0700
X-CSE-ConnectionGUID: qkomBxKOQnCv852Jv9zfTQ==
X-CSE-MsgGUID: N7jvmjAXQvuD4QqDzKMsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="149832260"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:48:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 07:48:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 07:48:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.71)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 07:48:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESnAmRI3Y0TbPFqeioa2Vwww/77meQkAhA3rbocFoS6Fm0JvCSknB/pTnNMDIJtcZt0tnCHCAJc2/6p853Dj2pKLsQrSUSfwTSmUKKndH7jhqp3OBpqbAlYi3wLoPKJPPUWyXZa8dvpBxpvnNzwTKT99M8CQbEuPbgAqnm+x85CsvYcp62aeE/qYYVj5rzRP6NNzoE4/e0SPaCiyJBFp+l0GleaFTLBtNP8SIZF2ouqXA/ROIPsn/bGczvUR7P8It0qZgKONQHLneia57GIj6qMwdYf3kKOj3AKhZyRPfHFbPlRePB2PsRkpxnJ/vWVZyJ9s98SpK0jM26iuHuDIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrj0gwpcXJs1Y2qk510BBQIScp5s4VCfxaKCDF5i6W8=;
 b=PZtBpTlR4Qtv+rdF1Ll77xJQAQOw3x8m+B4+nd46M8KiPeKMI2CEWWlWurNpFPptIT2ZHVxeOdK9Mud0m1wLOUf/Y/2SYg6oQuF5UsBGCztgQYNS8pUHs5dazeCIds7MHBQjXJmstbMi3qzzlb38F6O6WBOVB6iF7TlS1UIi2GhU3y+R7yOBFeKLzpzQ5JEnZ6Ba+kL/+5hIgesvd1WFQUnwHMkTBfWqp7KuTyfeoWeByJxCzqPjyKzX+jOq0FXxDUQUsPLrILOHe9ofXkW+xvqJVSvyjsU9vHyjkshHFNowLN+TScn7TUlmModDV2kMIZvfGW3lpdxprW/lX6niBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 14:48:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:48:25 +0000
Date: Mon, 2 Jun 2025 09:48:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana"
	<riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	<intel-xe@lists.freedesktop.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe: Support for I2C attached MCUs
Message-ID: <ixdkpl3ssri7ggv7yxhdla4ft5hbyce6a2ngvmypgkmjc5tj4a@qqbebbzhkd2b>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
 <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e500dc-a651-4f41-4804-08dda1e4872f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8BPEGEGQYdtyEWe0+cE1cSRpa+Mkaf88TqcyVzvbOQJvPc2i/ZMzNol/nuL4?=
 =?us-ascii?Q?VITuDYh6lXaOBv9841W0cyFW8D0TQREahKbv6MepibxFiCRP4n2l8A3c+Ypu?=
 =?us-ascii?Q?MuBzR76sElc3bUbImizxNR8VZMXQT3afJa2Qa2F1HzJvP9G4byQniDBCTq8Y?=
 =?us-ascii?Q?foBnoEmXmhEndePVUdD7E8vQls44IlyWrHJQypMiDthaJD/g+lAL+Xa32tB2?=
 =?us-ascii?Q?WqD+TP5PMTQgyr8u6TRf3Ss5GppcRuiLzMEh59pOicOoUEKC96C4srfNvCfF?=
 =?us-ascii?Q?TQ4Dc1Q3lI3yowJ7DpdQNATVwN+VUKWLTpr5BX4wdLQHt/gu0eGQvYrYGTOm?=
 =?us-ascii?Q?/Qs2uHZGH0J2HzE5v+cA5SXm8K0Quf3DkZQLxC+6+72FT7KPMmAPOz2Xdtyx?=
 =?us-ascii?Q?uuuE+0QzJ4Tg0NkIKjbUPuRptzVrM0l1H4wiClNow5AeKwpCbo/XfBLNBgnw?=
 =?us-ascii?Q?11RfC3K3O94Qt5iwyZd+a6XqivU0FxrafVCnAdjHg8wtdYPY1RQN/vhCr01I?=
 =?us-ascii?Q?2L8O/SJFKTSNdy1aP66sJ1H+8WHWQhVdZwD1sM0IfbUkq+Bt7/62EFw1MIQo?=
 =?us-ascii?Q?u+uoxRrKDyD8EyyngQ/yii0XYCZWTQRxqoPcTs0g/2NtlHCgOWJPOw3eZtvf?=
 =?us-ascii?Q?dclGX53xxzyvCDSD+6AWmV1qD6vMuy0ejWlon+xKu3ob3rGkdiFH5BQoPB32?=
 =?us-ascii?Q?d9Ggoa+tiY+ol5V9CnftCHCyVV4BSVj92ECjED/LpMHABna3TuE0qi5xEkN2?=
 =?us-ascii?Q?yHgqZ1dUHmcHZOkPhffjC01GTVLELntqhRC0DOv/Z2AHpWrHSBImep9Nz9Pf?=
 =?us-ascii?Q?7n41/7EgPmxQQt9JzKt8GWJY42XcKfvpQLDRy5h/UewUkcwbH21P3HY2PTju?=
 =?us-ascii?Q?ihNUwP/m82x4XZsFECjL/n//Y3Fy7UJ5VvSOyv0j3CpsjYyQSjORl2ULGt8/?=
 =?us-ascii?Q?c1BgMw0ITGmmDmRSiALoykOqUjVmYioDBq4cUdDonTozLQ7NTSLtjx1wUiwe?=
 =?us-ascii?Q?vrc7AdToOTWgz5VKDPn3BZn8OT5FagLG33jKr32wu5OKvQRqJHaEt7WcIpwX?=
 =?us-ascii?Q?iDMVMhES2lQE2/fCRXUyq/b2dj6YagIA1wzoTayy/U171ZLJGQso7vQ4IQRB?=
 =?us-ascii?Q?FIjd0XINvrKh9+pZddCz1nfVaM1b5darkhnYqM/3ss4jrN8T9Op+8mlrtglA?=
 =?us-ascii?Q?nrbbumUyNlPKIweIUCJ1jGE6RcDyZ2X8dtBJyR6tXQJwI0gYG35nQ4Cao5Qe?=
 =?us-ascii?Q?g33PW0SinOIb+GonVWtI6GoHlQw24zA1UKpYsvgxJoXl9QRT9S5VVjuDt0x8?=
 =?us-ascii?Q?XO0yqcNhmD17UKbkg79MjuEwvM5aA6dpwzL9VUkLO4SF8yWHooFdrsMbH1un?=
 =?us-ascii?Q?31jhHGq/xB6dfXRvzFhqfcoZcDUv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pf9Tfj49y/H2ar8yKx0PWYbnpVOCSjw0ePdnUoUFgL2Zjc2xbwNXibvGem8d?=
 =?us-ascii?Q?u5C3zau3kFL1QdkVxhi+MlbHIr0qTHubXVvQejQT9lPt1pR4+xIwQj+M8/Ti?=
 =?us-ascii?Q?vuHpu/JbPS0/QH1uOBl14B2t4JIJjZmavqRqXKBi3vnH3Z2UYh6juGnUpIxH?=
 =?us-ascii?Q?uA7bElKnxfpN6bLn7Fm84NW1MsJArr5C6EPCeKRCqpQKrLO2dI5LZHMxZkQK?=
 =?us-ascii?Q?M4V8s5whaxL28x9a6FCIALadohCNjXq0R1TD2EpGPjIkwL1r6wRHyldw7Z0j?=
 =?us-ascii?Q?spLmd3MwTE+a0qKzzcf8ntdlbl7+UlUCS2xsbDlduVW4c04zVMeMXhpOtZ2A?=
 =?us-ascii?Q?aQ5aqwsZAS7+7b2h0p071uciYKtwBJzs7GrqSvCVEXIZOiyAD32G/82LTDdE?=
 =?us-ascii?Q?o/2LLvlHemtIOfrgFQ0auhWTtxzabxRe9IC4sggZ7D3rKU/XYxAK0zeWfdgP?=
 =?us-ascii?Q?TzZg1t7tSLHJV2+FRTp6+OGXmDZPqb8jVoE7YriNTZI+4pbTZ9EAkuyGsNNH?=
 =?us-ascii?Q?LAWeNlVZlDkFvxswUPMZxzEKXC0Kw64Opi7Xdz/wtyyetDvNrNfPwnyG/l0i?=
 =?us-ascii?Q?oo2JrfInSRel4KpQbyVpY1r9nbVbfQQ/pMhdhavBoXO7DdpIe3eeGHBUHPbb?=
 =?us-ascii?Q?J1p8L4RpqpkxITjuGIsbwFj/TJIJ9voTDLFh4wXLWa2XrDXAy18whgaEUWyG?=
 =?us-ascii?Q?nqF976froAiFYoEBnaEn9XGjqqFFFiEaUA7JFsopcqGfduF4ddYBwNC0v5pW?=
 =?us-ascii?Q?eFx6qfVzHXcMzPz6f2w2KTQyVYuJ0CyiwWOArUTnzT4AhEri24Wl/lrS/OMM?=
 =?us-ascii?Q?sepIljMpiKEsuH4+9u0gUVrDxSBXgMcPTQsbnmJ02tNldC+WpTzoO/44iAAO?=
 =?us-ascii?Q?cVk3vJULy1bJJYQy23RSvbnuVs96X2ngoq7GFqFhCRJZnpSgrg0v2tB7C9Z9?=
 =?us-ascii?Q?bbvcHY8JAvRZAmd8QoIXaR09PtReFZwoq2PaAD0KeYWgxN7WBas0dKyQcTVG?=
 =?us-ascii?Q?Dcm/n8fT2Vtbfey0JgTVptB+f9rGl9Tj8y3RY9hrmdxQCPQ7UuvRRFDE7Uad?=
 =?us-ascii?Q?nUqmHNawIPWlvMjegdD1j+LE2uoVfNpqIxPMseu7WOjKK+KiOHLtS9jXrc9e?=
 =?us-ascii?Q?Pdd0CqsWFvMP9aN4GHYbcRlPJZefQ5+a6C/voEIt7qvXw6l/JHq/TnOk6sxi?=
 =?us-ascii?Q?487elnzrIn5gmBj1eIGaTn9cUbEXltNfdfj8hdu03wGf4vZyF9yW4YMrEgux?=
 =?us-ascii?Q?d2fJK2Ek8R2lRtfBPIBJoNIcO7mhccq7D+bpxHZULUg7EOEP1dowLj9KHvlh?=
 =?us-ascii?Q?IoXGMbONSoSqRqe6nsfAOFh9IvhpQTX2lVeaLLqTFMmDBDjhvMvRZDABXTES?=
 =?us-ascii?Q?BlB2RQbcIKkK5BEeS3w0Me2ymW6h57thXDEcNicHpHR5WvCF24NSH8XDV/25?=
 =?us-ascii?Q?mDij1HcZkvMVcm3HFBIv7QRM1vEqoc7AhPsAasUC/3N4xBg2WGx8NztSIla4?=
 =?us-ascii?Q?aI75qLKDIFkNYG8d5Ty/rESfw7VP/WmhM+izTz1OGSz5X7dsSeyS+zPfXEz7?=
 =?us-ascii?Q?3zKcmzJdyxu8yR2lXxog4syNg8M3a7fDf4+/P2ksm6P79Z6TqR1FEx5fbuI4?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e500dc-a651-4f41-4804-08dda1e4872f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:48:25.1917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAAMPx+VwsMv+AZVjDX4qn3m8FkUd+gMDgCvhSrOUj8XTBcIs9jwA82IaT+LxF3wP6j4uD9Po2h2zVy0udDleIx+mV1OAG3NENE24T2ZQsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
X-OriginatorOrg: intel.com

On Fri, May 30, 2025 at 05:17:44PM +0300, Heikki Krogerus wrote:
>Adding adaption/glue layer where the I2C host adapter
>(Synopsys DesignWare I2C adapter) and the I2C clients (the
>microcontroller units) are enumerated.
>
>The microcontroller units (MCU) that are attached to the GPU
>depend on the OEM. The initially supported MCU will be the
>Add-In Management Controller (AMC).
>
>Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Please use drm-tip as base for the patch series, otherwise we can't run
CI to make sure it doesn't regress:
https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-tip.html

We will probably also need new tests in igt.

>---
> drivers/gpu/drm/xe/Makefile           |   1 +
> drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  16 ++
> drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
> drivers/gpu/drm/xe/xe_device.c        |   3 +
> drivers/gpu/drm/xe/xe_device_types.h  |   4 +
> drivers/gpu/drm/xe/xe_i2c.c           | 270 ++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_i2c.h           |  60 ++++++
> drivers/gpu/drm/xe/xe_irq.c           |   2 +
> 8 files changed, 357 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
> create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index e4bf484d4121..3f581e2bb564 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -124,6 +124,7 @@ xe-y += xe_bb.o \
> 	xe_wait_user_fence.o \
> 	xe_wopcm.o
>
>+xe-$(CONFIG_I2C)	+= xe_i2c.o
> xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
>new file mode 100644
>index 000000000000..2acb55eeef0d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
>@@ -0,0 +1,16 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+#ifndef _XE_I2C_REGS_H_
>+#define _XE_I2C_REGS_H_
>+
>+#include "xe_reg_defs.h"
>+
>+#define SOC_BASE			0x280000
>+
>+#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
>+#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
>+#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
>+
>+#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
>+#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
>+
>+#endif /* _XE_I2C_REGS_H_ */
>diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>index f0ecfcac4003..13635e4331d4 100644
>--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>@@ -19,6 +19,7 @@
> #define   MASTER_IRQ				REG_BIT(31)
> #define   GU_MISC_IRQ				REG_BIT(29)
> #define   DISPLAY_IRQ				REG_BIT(16)
>+#define   I2C_IRQ				REG_BIT(12)
> #define   GT_DW_IRQ(x)				REG_BIT(x)
>
> /*
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index d4b6e623aa48..dd635101420b 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -42,6 +42,7 @@
> #include "xe_guc.h"
> #include "xe_hw_engine_group.h"
> #include "xe_hwmon.h"
>+#include "xe_i2c.h"
> #include "xe_irq.h"
> #include "xe_memirq.h"
> #include "xe_mmio.h"
>@@ -929,6 +930,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_vsec_init(xe);
>
>+	xe_i2c_probe(xe);

please don't ignore errors on probe, it's painful to keep fixing this up
later. See e.g.

	35359c36356a drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
	292b1a8a5054 drm/xe: Stop ignoring errors from xe_heci_gsc_init()
	d40f275d96e8 drm/xe: Move survivability entirely to xe_pci
	62fbc75b28a7 drm/xe/hwmon: Stop ignoring errors on probe
	6b5506158f90 drm/xe/pmu: Fail probe if xe_pmu_register() fails
	960d71044eee drm/xe/oa: Handle errors in xe_oa_register()

if it's failing we want to catch it in our CI rather than realizing much
later a subsystem integration was not really working and the driver is
in a semi-working state.

>+
> 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>
> err_unregister_display:
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 50b2bfa682ac..7011a078b9c7 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -36,6 +36,7 @@
> #endif
>
> struct xe_ggtt;
>+struct xe_i2c;
> struct xe_pat_ops;
> struct xe_pxp;
>
>@@ -572,6 +573,9 @@ struct xe_device {
> 	/** @pmu: performance monitoring unit */
> 	struct xe_pmu pmu;
>
>+	/** @i2c: I2C host controller */
>+	struct xe_i2c *i2c;
>+
> 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> 	u32 atomic_svm_timeslice_ms;
>
>diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
>new file mode 100644
>index 000000000000..cc231368789f
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_i2c.c
>@@ -0,0 +1,270 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Intel Xe I2C attached Microcontroller Units (MCU)
>+ *
>+ * Copyright (C) 2025 Intel Corporation.
>+ */
>+
>+#include <linux/array_size.h>
>+#include <linux/container_of.h>
>+#include <linux/device.h>
>+#include <linux/err.h>
>+#include <linux/i2c.h>
>+#include <linux/ioport.h>
>+#include <linux/irq.h>
>+#include <linux/irqdomain.h>
>+#include <linux/notifier.h>
>+#include <linux/pci.h>
>+#include <linux/platform_device.h>
>+#include <linux/property.h>
>+#include <linux/regmap.h>
>+#include <linux/sprintf.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+#include <linux/workqueue.h>
>+
>+#include "regs/xe_i2c_regs.h"
>+#include "regs/xe_irq_regs.h"
>+
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_i2c.h"
>+#include "xe_mmio.h"
>+#include "xe_platform_types.h"
>+
>+/* Synopsys DesignWare I2C Host Adapter */
>+static const char adapter_name[] = "i2c_designware";
>+
>+static const struct property_entry xe_i2c_adapter_properties[] = {
>+	PROPERTY_ENTRY_STRING("compatible", "intel,xe-mcu-i2c"),
>+	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
>+	{ }
>+};
>+
>+static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
>+{
>+	u32 *val = ep;
>+
>+	val[0] = xe_mmio_read32(mmio, CLIENT_DISC_COOKIE);
>+	val[1] = xe_mmio_read32(mmio, CLIENT_DISC_ADDRESS);
>+}
>+
>+static void xe_i2c_client_work(struct work_struct *work)
>+{
>+	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
>+	struct i2c_board_info info = {
>+		.type	= "amc",
>+		.flags	= I2C_CLIENT_HOST_NOTIFY,
>+		.addr	= i2c->ep.addr[1],
>+	};

so... AMC is not a new thing. We also have it in PVC for example.
However the way it is exposed to the driver seems to be different
and what you did here here wouldn't match.

>+
>+	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
>+}
>+
>+static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
>+{
>+	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
>+	struct i2c_adapter *adapter = i2c_verify_adapter(data);
>+	struct device *dev = data;
>+
>+	if (action == BUS_NOTIFY_ADD_DEVICE &&
>+	    adapter && dev->parent == &i2c->pdev->dev) {
>+		i2c->adapter = adapter;
>+		schedule_work(&i2c->work);
>+		return NOTIFY_OK;
>+	}
>+
>+	return NOTIFY_DONE;
>+}
>+
>+static int xe_i2c_register_adapter(struct xe_i2c *i2c)
>+{
>+	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
>+	struct platform_device *pdev;
>+	struct fwnode_handle *fwnode;
>+	int ret;
>+
>+	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
>+	if (!fwnode)
>+		return -ENOMEM;
>+
>+	/*
>+	 * Not using platform_device_register_full() here because we don't have
>+	 * a handle to the platform_device before it returns. xe_i2c_notifier()
>+	 * uses that handle, but it may be called before
>+	 * platform_device_register_full() is done.
>+	 */
>+	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
>+	if (!pdev) {
>+		ret = -ENOMEM;
>+		goto err_fwnode_remove;
>+	}
>+
>+	if (i2c->adapter_irq) {
>+		struct resource	res = { };
>+
>+		res.start = i2c->adapter_irq;
>+		res.name = "xe_i2c";
>+		res.flags = IORESOURCE_IRQ;
>+
>+		ret = platform_device_add_resources(pdev, &res, 1);
>+		if (ret)
>+			goto err_pdev_put;
>+	}
>+
>+	pdev->dev.parent = i2c->drm_dev;
>+	pdev->dev.fwnode = fwnode;
>+	i2c->adapter_node = fwnode;
>+	i2c->pdev = pdev;
>+
>+	ret = platform_device_add(pdev);
>+	if (ret)
>+		goto err_pdev_put;
>+
>+	return 0;
>+
>+err_pdev_put:
>+	platform_device_put(pdev);
>+err_fwnode_remove:
>+	fwnode_remove_software_node(fwnode);
>+
>+	return ret;
>+}
>+
>+static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
>+{
>+	platform_device_unregister(i2c->pdev);
>+	fwnode_remove_software_node(i2c->adapter_node);
>+}
>+
>+void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
>+{
>+	if (!xe->i2c || !xe->i2c->adapter_irq)
>+		return;
>+
>+	if (master_ctl & I2C_IRQ)
>+		generic_handle_irq_safe(xe->i2c->adapter_irq);
>+}
>+
>+static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
>+			  irq_hw_number_t hw_irq_num)
>+{
>+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
>+	return 0;
>+}
>+
>+static const struct irq_domain_ops xe_i2c_irq_ops = {
>+	.map = xe_i2c_irq_map,
>+};
>+
>+static int xe_i2c_create_irq(struct xe_i2c *i2c)
>+{
>+	struct irq_domain *domain;
>+
>+	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
>+		return 0;
>+
>+	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
>+	if (!domain)
>+		return -ENOMEM;
>+
>+	i2c->adapter_irq = irq_create_mapping(domain, 0);
>+	i2c->irqdomain = domain;
>+
>+	return 0;
>+}
>+
>+static void xe_i2c_remove_irq(struct xe_i2c *i2c)
>+{
>+	if (i2c->irqdomain) {
>+		irq_dispose_mapping(i2c->adapter_irq);
>+		irq_domain_remove(i2c->irqdomain);
>+	}
>+}
>+
>+static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
>+{
>+	struct xe_i2c *i2c = context;
>+
>+	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
>+
>+	return 0;
>+}
>+
>+static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
>+{
>+	struct xe_i2c *i2c = context;
>+
>+	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
>+
>+	return 0;
>+}
>+
>+static const struct regmap_config i2c_regmap_config = {
>+	.reg_bits = 32,
>+	.val_bits = 32,
>+	.reg_read = xe_i2c_read,
>+	.reg_write = xe_i2c_write,
>+	.fast_io = true,
>+};
>+
>+static void xe_i2c_remove(void *data)
>+{
>+	struct xe_i2c *i2c = data;
>+	int i;
>+
>+	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
>+		i2c_unregister_device(i2c->client[i]);
>+
>+	xe_i2c_unregister_adapter(i2c);
>+	xe_i2c_remove_irq(i2c);
>+	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);

this looks racy. Shouldn't you unregister the notifier before the other
2 calls?

>+}
>+
>+int xe_i2c_probe(struct xe_device *xe)
>+{
>+	struct xe_i2c_endpoint ep;
>+	struct regmap *regmap;
>+	struct xe_i2c *i2c;
>+	int ret;
>+
>+	if (xe->info.platform != XE_BATTLEMAGE)
>+		return 0;

we prefer checking for IP versions but don't have a good way for the SOC
versioning. However bspec 54028 seems to disagree here. It
would probably be better to check on the GT IP + is_dgfx. Or if it's
safe to rely on the cookie below, just check for is_dgfx.

>+
>+	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
>+	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
>+		return 0;
>+
>+	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
>+	if (!i2c)
>+		return -ENOMEM;
>+
>+	INIT_WORK(&i2c->work, xe_i2c_client_work);
>+	i2c->mmio = xe_root_tile_mmio(xe);
>+	i2c->drm_dev = xe->drm.dev;
>+	i2c->ep = ep;
>+
>+	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
>+	if (IS_ERR(regmap))
>+		return PTR_ERR(regmap);
>+
>+	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
>+	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
>+	if (ret)
>+		return ret;
>+
>+	ret = xe_i2c_create_irq(i2c);
>+	if (ret)
>+		goto err_unregister_notifier;
>+
>+	ret = xe_i2c_register_adapter(i2c);
>+	if (ret)
>+		goto err_unregister_notifier;
>+
>+	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
>+
>+err_unregister_notifier:
>+	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
>+
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
>new file mode 100644
>index 000000000000..ab8e21630838
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_i2c.h
>@@ -0,0 +1,60 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+#ifndef _XE_I2C_H_
>+#define _XE_I2C_H_
>+
>+#include <linux/bits.h>
>+#include <linux/notifier.h>
>+#include <linux/types.h>
>+#include <linux/workqueue.h>
>+
>+struct device;
>+struct fwnode_handle;
>+struct i2c_adapter;
>+struct i2c_client;
>+struct irq_domain;
>+struct platform_device;
>+struct xe_device;
>+struct xe_mmio;
>+
>+#define XE_I2C_MAX_CLIENTS		3
>+
>+#define XE_I2C_EP_COOKIE_DEVICE		0xde
>+
>+/* Endpoint Capabilities */
>+#define XE_I2C_EP_CAP_IRQ		BIT(0)
>+#define XE_I2C_EP_CAP_MULTI_MCU		BIT(1)
>+#define XE_I2C_EP_CAP_SMBUS		BIT(2)

these 2 are unused?

>+
>+struct xe_i2c_endpoint {
>+	u8 cookie;
>+	u8 capabilities;
>+	u16 addr[XE_I2C_MAX_CLIENTS];
>+};
>+
>+struct xe_i2c {
>+	struct fwnode_handle *adapter_node;
>+	struct platform_device *pdev;
>+	struct i2c_adapter *adapter;
>+	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
>+
>+	struct notifier_block bus_notifier;
>+	struct work_struct work;
>+
>+	struct irq_domain *irqdomain;
>+	int adapter_irq;
>+
>+	struct xe_i2c_endpoint ep;
>+	struct device *drm_dev;
>+
>+	struct xe_mmio *mmio;
>+};
>+
>+#if IS_ENABLED(CONFIG_I2C)
>+int xe_i2c_probe(struct xe_device *xe);
>+void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
>+#else
>+static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
>+static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
>+#endif
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 5362d3174b06..c43e62dc692e 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -18,6 +18,7 @@
> #include "xe_gt.h"
> #include "xe_guc.h"
> #include "xe_hw_engine.h"
>+#include "xe_i2c.h"
> #include "xe_memirq.h"
> #include "xe_mmio.h"
> #include "xe_pxp.h"
>@@ -476,6 +477,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> 			if (xe->info.has_heci_cscfi)
> 				xe_heci_csc_irq_handler(xe, master_ctl);
> 			xe_display_irq_handler(xe, master_ctl);
>+			xe_i2c_irq_handler(xe, master_ctl);
> 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> 		}
> 	}
>-- 
>2.47.2
>

