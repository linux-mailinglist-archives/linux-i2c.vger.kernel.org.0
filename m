Return-Path: <linux-i2c+bounces-11498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F943ADBB3E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 22:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B92F31761DB
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 20:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4595120F063;
	Mon, 16 Jun 2025 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWeja8Zq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7D820B207;
	Mon, 16 Jun 2025 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105861; cv=fail; b=QfHmIDgEV2hlWte4cCvwKGKP4Qhc7oWcTwQM2QMYDdH25kgNS0M0H5O1XjPqpQgVZfYV25PEH9jX6lJ04dGD/VqKvSAe9CZTvfjGY3M4alOvvfjQNYPKJMGDoCHZtZv0YkPX1kzVJIEMiU8ztPi4d2dyBDPMbWkwRJtmT1LMwj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105861; c=relaxed/simple;
	bh=OSCH59PgPAbTk6DVYOnXWhmO4v2jAqX9mzf0z+UmDlY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QfCawF5cklMq1/XFHTtvapX+0+3ZXwWLQtUG9la3iiYRlK3UBpw4lHe6GGjNJMdJ7C70bC3Wss+2k9eYqLNQo78KV1b1mJj4SbFe7n7A4ii9YBwHx7nNlzQ7MAyRa0ZGgs3FUSCqRsKRi6JKQKMqK8Qo/D9GT2mHkW2gz8ka/7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWeja8Zq; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750105859; x=1781641859;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OSCH59PgPAbTk6DVYOnXWhmO4v2jAqX9mzf0z+UmDlY=;
  b=hWeja8ZqhoCFCtmUEMyZW346EjIL+GBf4wWymgIDN0/fR25CRcAp6BTM
   rZn/2PJggkTI/6pSysp/MQ+vVA1Dfy1O9tOTFRFjeccGJFA94cvlFfSCM
   j1nwJTiixci2kM9IU1tQaBdc2cHjwD8sN88hOTqFA+CmhweQL1uJvMf1j
   Xiat4lNWJwFLCt+ZDMi9mbX9gTLyXYHXL+LMrVHexjo9FddQ9/6lUJeXM
   FqY+av10XwMEUljL0wh1+2PpnTntMcab5qJbLONiopu9js4tixpxEG1Tq
   uIPJbNlUQQ3IuqRKihioANDdaQnimuIkYUWsC4HLmWflO/4v+MX622CFJ
   w==;
X-CSE-ConnectionGUID: r5cKwHlDTfm6txKuZF4HyQ==
X-CSE-MsgGUID: gURC3X1SS0a4bagSXuFoBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52127977"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52127977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 13:30:27 -0700
X-CSE-ConnectionGUID: iEnCIjevTni8JmNNGIREIw==
X-CSE-MsgGUID: 1tnAzr1oRKuZzEEG2dw0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148935675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 13:30:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:30:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 13:30:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:30:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXWliX3+3Aw6DngyxgVnvOuZzkdOmg2KdwyMbsWaNUcOv5EIO/ExgdCK3aYrRIEJO1uRKw4/AIV8LJUkuDr7qClrGPc8yRkbsBex7tbIvG7xkD2BYHq5j6ba4lu0kaoi621AiFHwOMIJoDwJXUjOSV8eBGgSQNQoHhe4NsEqdrysjZJwZ2dqFJdVXeSwHBLyJO7WXkQsYCkXCY5XTkJTnqUCnYTsSJwObM+2nYwqKC8+dd4MSpUoKf2dlOZZRoYyqsxuu4npb7dtwFNoVOvADwTLqpku/eWMXlapCYkjx2H2CIozuJOSuvOT5pgUoE+N+7Sbpq7OaSkMG1O+JSMIXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjTyJyjKsThTS2jCaT8efnzoPrLLIZTNVUWLeKd/zdo=;
 b=JGqi/kPzFfYZLoaT52th+cjBEM3QfsP3c3LVCK7ZhujYaeu9t93TIx7kVCYTHyu7cQmUwTzq9rF7MR13yfemGI0lE94NceICYukT24PDGoz8JuI1SMAVD6bI5peElADKhjKUiDa9Z6OtILICQwTBCxo0CpGw8ZqK7LmCb7OJd0MWonMuLvpm5S4cZiR1UVdH6EmLDt6jLtvInXW8X8hSBZjM5cKwy+W0gjx11TDvlXr9HXKOFdZtncUsoqgWqUKPibOF+aadimGDnF/q0VHzAL6679xeI1fB9vZ82z2MelfIygKR1fSPehGDBv2avLQvPFA6PBsrUJaqgz6JM7kWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 20:30:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 20:30:19 +0000
Date: Mon, 16 Jun 2025 16:30:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Jarkko
 Nikula" <jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana"
	<riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<intel-xe@lists.freedesktop.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aFB-y_bObI8LZvzp@intel.com>
References: <20250612132450.3293248-1-heikki.krogerus@linux.intel.com>
 <20250612132450.3293248-3-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250612132450.3293248-3-heikki.krogerus@linux.intel.com>
X-ClientProxiedBy: ROAP284CA0319.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f9::6)
 To CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 4925c3c0-e9a4-4a2e-b798-08ddad149c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5HnO6Dys7DoZ+LQu6Eek+8wfHDabCeymmXU5SOKU9Dx9C5wRKa5eqvIj3XXG?=
 =?us-ascii?Q?QSxd/PotxXQPUTubFQjGTY+gtpeoGMXmgU6gZ5gEW5EHvevB9qDU6ZxlTL0s?=
 =?us-ascii?Q?VwCRUfR2CJfAUOdOTKw3TF/WAKJ1nAja6JKyT4XpdBf5ONBULISEtCXiutAJ?=
 =?us-ascii?Q?jVsQVYojjmjQhAYyxLkB+PMF+X8gIRxzmnpbsvJLv4sBydR9m6C1yBUiPRMo?=
 =?us-ascii?Q?gVQtIKAfiUTHSkE3EO5HVJNieQT5S6hPNTvKuip07aZKXzK+2gnH7Az0Q/RV?=
 =?us-ascii?Q?oNfwHqCnF0nRLbZsdYhCg+WVawKFY5eBdDi+xgqTLfoLvoPV8gXpnbVsKF2Z?=
 =?us-ascii?Q?5kFbe+nDpCAZdpOo15LH4h9hZ9D/vpZBjwHD49/L6x+nOSZ9T3NqZDzpvfMK?=
 =?us-ascii?Q?Pn1p3PT+rMmJsimMXGgDM4UNQZwWk5a4u1wnLh2gzst98IyAJcVG9y8pPlfq?=
 =?us-ascii?Q?0ZkWc5Sup8ucdbd8W89M1Y1DxBl0QWTkpWyJraEMlqVj0RvX/INQR5IMqdi3?=
 =?us-ascii?Q?Vbs5feygdIpxG8o/D55RLr9axrTVDZBWtwHDjYSadWGE0BYkl9sa6mXG0zhM?=
 =?us-ascii?Q?rpGjart7VKdLgIuh17CYEHfXvHST6zU4UvwqJDBL8zUSbzRzUXQcPwqs4LY/?=
 =?us-ascii?Q?I1sIF/DkwDZuJLgTKtCQYYcVrRkzDbHPrv4bVfyqG+bA2skVSWH7tu58fOVZ?=
 =?us-ascii?Q?CC1BNVdDA9qC5iX16fo8JUZKqYtQhh7WBVRJamGK32lSO2EvEHSuvRBABvrl?=
 =?us-ascii?Q?prJugtdMtvIpQ/1CpD1H44ZzjIz2/AY2G1J202w2gvqo8HiprJLvcAeOaYpy?=
 =?us-ascii?Q?YWvMnhIU52XE3PSUNe9YWTPm5vpCEncXy7H0crcHuK5V/+D6idFN8/j30lg5?=
 =?us-ascii?Q?7xUTaHTwzDWOeFHjNkIQsaQ3G89PpeV1rROaVOb7gn+hSji3do0nsLh0QOub?=
 =?us-ascii?Q?eOsWX7kmUaVytZpNY0R9WjaXPckiGd9f1mgwB2WEMWjVkFiWdyuoUc/BF7nm?=
 =?us-ascii?Q?drSbBxyRuiB6nyksqDSohZ0yx4xRnPt2XD8/59mBSe6ioAwJMj7/ROC0xlqg?=
 =?us-ascii?Q?IO4/cyxQEiPuBz/o4Z9k0ZZ1eAmRaCV7jgIo7mcPlGdppmvPQ7Wb/D9kswOR?=
 =?us-ascii?Q?4eF22ukFO2rxFp01+5kkPWWfo9A0tO7uajd77St8V1R5cU+DNI4t1r/8tDZK?=
 =?us-ascii?Q?knhBFgLv2OQd+hPqrt52mNZbt2yOEdn2aE1HMjJvKgB/1ljZ4ACMMGJtZDt6?=
 =?us-ascii?Q?jZg5daYBb2K1+MuoDY7X+PXb87sktNb3hlPAYzO8mTfMk5XkAWdTc69Sasp/?=
 =?us-ascii?Q?JD3suCg5HcS7wF3dCzYonYpzZ+GGw1AthIHmfUmvDJtOxZvj5IlWQoh1dsBN?=
 =?us-ascii?Q?3Mcir9W0FG1WhTyBXHKkNhhhBswzlpqZ9zdE79mjPQrMNQhWrGXSyrJnhMvA?=
 =?us-ascii?Q?DGnaJ2teo1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7JHXIP9MqvGzEAJUwN7SSTKnFqEUAgX0jycHGmCvdNO8JEb6byQ0XiVVyX0Q?=
 =?us-ascii?Q?3ljcNO0VKpSLhX4a3mcVJOoF5i0ZQfL74OQaK78O2Y18IA8LkXn/GSrDj34e?=
 =?us-ascii?Q?7JEwPV3FGLRoS+q55NMBeKVL97ChmbJzjNn+/xfgIerDywpNf2aQPZGbcVCh?=
 =?us-ascii?Q?QbwhWWfbex+PlCpoGEVvzFiSkplMjsQXMTVMRlA5kxo3BaAKm0J0ORKXbGPL?=
 =?us-ascii?Q?AZ2SW8wEQ+vOJgehmkjFzJntfUAGcMe0YLT3E3FHRpRDwgQjSwjOjYCQLNC1?=
 =?us-ascii?Q?ta9WzRRqgCpYIMM+5fqhPHWs9+f5uBbfI6+30ZrLBQqg6hjcUHjA+6Cfj2yu?=
 =?us-ascii?Q?vbgkOeu79qm0lEksfKq3RCfGaJOpecBivFO9gVyJFPpOD35QJkUPb5KZeFYA?=
 =?us-ascii?Q?E1Xnnme+uJYTC8/O0lxXpN+pjAfVsUhmw/R6xak9aUwkAWXecMqjImfNuDgn?=
 =?us-ascii?Q?rZQPGjcr6yMm2FlnBmXrZHAnO/Vdr2KRGXM9ZwNHWmVQW1g5J3zywfa3M44F?=
 =?us-ascii?Q?GSuDddWxmAgPPSTFGzY2tUrAgPtutYNiIHpT9vBkhWzPPaVey0ykNuZRO4qS?=
 =?us-ascii?Q?ZFtTN4p3ph0NTYXZ/Wkr8K+YGtqQi6/uy4K5momo3d47gB5vVsu6B/Xok3QT?=
 =?us-ascii?Q?EpfXAWc2+7n8N+AONVaKdxNiiyMqlRXOQXGVLHAAtxy6CkL7DqXClG7mOtRL?=
 =?us-ascii?Q?MYBY/HEanBZCVtkKMwiyrfW9a0ZcL3yjlD20BB4fTlcMs6lNcaepFVig78PR?=
 =?us-ascii?Q?LmkVDcFK2xgg6fqI//cAhONW2+lsE7btezq5NlqlQ35pRbHxsnEoVKQNkfcu?=
 =?us-ascii?Q?dV4dwig9UdGonU3ndTsB9NcX2oBbkjAweQnt9XbrucfPUf1Rkh52QuboFhLW?=
 =?us-ascii?Q?dDPUM3G8HC/GZmH+TSQnyDDoWNQOyWLG8g42fnaoIBOb9mcbbQqitOPBPJ5z?=
 =?us-ascii?Q?5CAvkGgm0e3pCZHmbvdfS0gVpBhPkKPWM0dAERUmYRQSoqgG03bXoNYPKmd+?=
 =?us-ascii?Q?F00wvzexQSsX9xi2SjUC6PCwfTebudx96IXeWk8SXI7b9zee2SI0xmWTtOT5?=
 =?us-ascii?Q?eybAHjFbUbAgnWDzz9qlIBEgG43vRFfvhf8MQ7Ptt/XCvJZM6YuiVDDfL9Zs?=
 =?us-ascii?Q?afnvs0CH4eIJcLPQZ9wx7ACktUzXsUJBThtAuSSqxNb8fK02tTWBSGgE7p61?=
 =?us-ascii?Q?cOWixiHxvM5DSZc4x/b+2T7rJFWW33jGngrEs32Pp4lRsGzrhth3QSiXWj0H?=
 =?us-ascii?Q?yUhzMthWbwrhc7Q4QMxi7gO6HkyC+eYlLU9SMPXGwaeeEWXQgjUG4dZK1lyz?=
 =?us-ascii?Q?jSPzUYv5B4P11ngXtg84fQ//wVNQCF2caWXTl1QUSdl27kAB4rn33ePrbE52?=
 =?us-ascii?Q?bmukvqK0iwr6P4E9ZTBf1BtBa/J1W/IvMPmOoC+7NCeGlLeryIlbDP3lBLJH?=
 =?us-ascii?Q?wH41yb6NSWBu7xMginfXWAQ24VSgp3yNM5QwDjfyOlBW4HoWvnYBuAJb+AP5?=
 =?us-ascii?Q?PkU54/QO/jVpUeRBXdHir05yl7QSHUcXMNRLba2P+EHPbDCiIVPHIkgdEXt6?=
 =?us-ascii?Q?y/W/zUU3D4uPl9nQCOzYEIRW0HZQ5Ie7BthLS+oU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4925c3c0-e9a4-4a2e-b798-08ddad149c15
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:30:19.0152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86vGiIQA4AEhfSxhSTra+OmarEmhjs/kWUW38eZmYIy4jvJiLPu/b031jqURMNL3hHIX3N66VAoq+Nz/T0xJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
X-OriginatorOrg: intel.com

On Thu, Jun 12, 2025 at 04:24:48PM +0300, Heikki Krogerus wrote:
> Adding adaption/glue layer where the I2C host adapter
> (Synopsys DesignWare I2C adapter) and the I2C clients (the
> microcontroller units) are enumerated.
> 
> The microcontroller units (MCU) that are attached to the GPU
> depend on the OEM. The initially supported MCU will be the
> Add-In Management Controller (AMC).
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig            |   1 +
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  15 ++
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_pmt.h      |   2 +-
>  drivers/gpu/drm/xe/regs/xe_regs.h     |   2 +
>  drivers/gpu/drm/xe/xe_device.c        |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   4 +
>  drivers/gpu/drm/xe/xe_i2c.c           | 270 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_i2c.h           |  58 ++++++
>  drivers/gpu/drm/xe/xe_irq.c           |   2 +
>  11 files changed, 360 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
>  create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index c57f1da0791d..5c162031fc3f 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -44,6 +44,7 @@ config DRM_XE
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
>  	select HMM_MIRROR
> +	select REGMAP if I2C
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..293552fc5aaf 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -124,6 +124,7 @@ xe-y += xe_bb.o \
>  	xe_wait_user_fence.o \
>  	xe_wopcm.o
>  
> +xe-$(CONFIG_I2C)	+= xe_i2c.o
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> new file mode 100644
> index 000000000000..fa7223e6ce9e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _XE_I2C_REGS_H_
> +#define _XE_I2C_REGS_H_
> +
> +#include "xe_reg_defs.h"
> +#include "xe_regs.h"
> +
> +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
> +
> +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)

Could you please send me some pointers of the spec for this registers
so I can help on the review here?

> +
> +#endif /* _XE_I2C_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index f0ecfcac4003..13635e4331d4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -19,6 +19,7 @@
>  #define   MASTER_IRQ				REG_BIT(31)
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   DISPLAY_IRQ				REG_BIT(16)
> +#define   I2C_IRQ				REG_BIT(12)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..2995d72c3f78 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -5,7 +5,7 @@
>  #ifndef _XE_PMT_H_
>  #define _XE_PMT_H_
>  
> -#define SOC_BASE			0x280000
> +#include "xe_regs.h"
>  
>  #define BMG_PMT_BASE_OFFSET		0xDB000
>  #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 3abb17d2ca33..1926b4044314 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,6 +7,8 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define SOC_BASE				0x280000
> +
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
>  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7e87344943cd..ca098ed532b5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -42,6 +42,7 @@
>  #include "xe_guc.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
> +#include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> @@ -921,6 +922,10 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		goto err_unregister_display;
>  
> +	err = xe_i2c_probe(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..8f3c5ea58034 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -33,6 +33,7 @@
>  struct dram_info;
>  struct intel_display;
>  struct xe_ggtt;
> +struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
>  
> @@ -573,6 +574,9 @@ struct xe_device {
>  	/** @pmu: performance monitoring unit */
>  	struct xe_pmu pmu;
>  
> +	/** @i2c: I2C host controller */
> +	struct xe_i2c *i2c;
> +
>  	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
>  	u32 atomic_svm_timeslice_ms;
>  
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> new file mode 100644
> index 000000000000..3d649602ede8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -0,0 +1,270 @@
> +// SPDX-License-Identifier: GPL-2.0

Does it really need to be GPL or could it be MIT?

(If you copied code from other files that are GPL, then it needs
to be GPL)

> +/*
> + * Intel Xe I2C attached Microcontroller Units (MCU)
> + *
> + * Copyright (C) 2025 Intel Corporation.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/ioport.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/notifier.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/sprintf.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +#include "regs/xe_i2c_regs.h"
> +#include "regs/xe_irq_regs.h"
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_i2c.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +
> +/* Synopsys DesignWare I2C Host Adapter */
> +static const char adapter_name[] = "i2c_designware";
> +
> +static const struct property_entry xe_i2c_adapter_properties[] = {
> +	PROPERTY_ENTRY_STRING("compatible", "intel,xe-i2c"),
> +	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
> +	{ }
> +};
> +
> +static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> +{
> +	u32 *val = ep;
> +
> +	val[0] = xe_mmio_read32(mmio, CLIENT_DISC_COOKIE);
> +	val[1] = xe_mmio_read32(mmio, CLIENT_DISC_ADDRESS);
> +}
> +
> +static void xe_i2c_client_work(struct work_struct *work)
> +{
> +	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
> +	struct i2c_board_info info = {
> +		.type	= "amc",
> +		.flags	= I2C_CLIENT_HOST_NOTIFY,
> +		.addr	= i2c->ep.addr[1],
> +	};
> +
> +	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
> +}
> +
> +static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
> +{
> +	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
> +	struct i2c_adapter *adapter = i2c_verify_adapter(data);
> +	struct device *dev = data;
> +
> +	if (action == BUS_NOTIFY_ADD_DEVICE &&
> +	    adapter && dev->parent == &i2c->pdev->dev) {
> +		i2c->adapter = adapter;
> +		schedule_work(&i2c->work);
> +		return NOTIFY_OK;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> +{
> +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> +	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> +	if (!fwnode)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Not using platform_device_register_full() here because we don't have
> +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> +	 * uses that handle, but it may be called before
> +	 * platform_device_register_full() is done.
> +	 */
> +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> +	if (!pdev) {
> +		ret = -ENOMEM;
> +		goto err_fwnode_remove;
> +	}
> +
> +	if (i2c->adapter_irq) {
> +		struct resource	res = { };
> +
> +		res.start = i2c->adapter_irq;
> +		res.name = "xe_i2c";
> +		res.flags = IORESOURCE_IRQ;
> +
> +		ret = platform_device_add_resources(pdev, &res, 1);
> +		if (ret)
> +			goto err_pdev_put;
> +	}
> +
> +	pdev->dev.parent = i2c->drm_dev;
> +	pdev->dev.fwnode = fwnode;
> +	i2c->adapter_node = fwnode;
> +	i2c->pdev = pdev;
> +
> +	ret = platform_device_add(pdev);
> +	if (ret)
> +		goto err_pdev_put;
> +
> +	return 0;
> +
> +err_pdev_put:
> +	platform_device_put(pdev);
> +err_fwnode_remove:
> +	fwnode_remove_software_node(fwnode);
> +
> +	return ret;
> +}
> +
> +static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> +{
> +	platform_device_unregister(i2c->pdev);
> +	fwnode_remove_software_node(i2c->adapter_node);
> +}
> +
> +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	if (!xe->i2c || !xe->i2c->adapter_irq)
> +		return;
> +
> +	if (master_ctl & I2C_IRQ)
> +		generic_handle_irq_safe(xe->i2c->adapter_irq);
> +}
> +
> +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> +			  irq_hw_number_t hw_irq_num)
> +{
> +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops xe_i2c_irq_ops = {
> +	.map = xe_i2c_irq_map,
> +};
> +
> +static int xe_i2c_create_irq(struct xe_i2c *i2c)
> +{
> +	struct irq_domain *domain;
> +
> +	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> +		return 0;
> +
> +	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> +	if (!domain)
> +		return -ENOMEM;
> +
> +	i2c->adapter_irq = irq_create_mapping(domain, 0);
> +	i2c->irqdomain = domain;
> +
> +	return 0;
> +}
> +
> +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> +{
> +	if (i2c->irqdomain) {
> +		irq_dispose_mapping(i2c->adapter_irq);
> +		irq_domain_remove(i2c->irqdomain);
> +	}
> +}
> +
> +static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct xe_i2c *i2c = context;
> +
> +	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
> +
> +	return 0;
> +}
> +
> +static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct xe_i2c *i2c = context;
> +
> +	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config i2c_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_read = xe_i2c_read,
> +	.reg_write = xe_i2c_write,
> +	.fast_io = true,
> +};
> +
> +static void xe_i2c_remove(void *data)
> +{
> +	struct xe_i2c *i2c = data;
> +	int i;
> +
> +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> +		i2c_unregister_device(i2c->client[i]);
> +
> +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +	xe_i2c_unregister_adapter(i2c);
> +	xe_i2c_remove_irq(i2c);
> +}
> +
> +int xe_i2c_probe(struct xe_device *xe)

could you please add some /** DOC: Xe i2c ... above
and then add some doc to the exported functions?

> +{
> +	struct xe_i2c_endpoint ep;
> +	struct regmap *regmap;
> +	struct xe_i2c *i2c;
> +	int ret;
> +
> +	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
> +	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return 0;
> +
> +	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
> +	if (!i2c)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&i2c->work, xe_i2c_client_work);
> +	i2c->mmio = xe_root_tile_mmio(xe);
> +	i2c->drm_dev = xe->drm.dev;
> +	i2c->ep = ep;
> +
> +	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
> +	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_i2c_create_irq(i2c);
> +	if (ret)
> +		goto err_unregister_notifier;
> +
> +	ret = xe_i2c_register_adapter(i2c);
> +	if (ret)
> +		goto err_remove_irq;
> +
> +	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
> +
> +err_remove_irq:
> +	xe_i2c_remove_irq(i2c);
> +
> +err_unregister_notifier:
> +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> new file mode 100644
> index 000000000000..e88845be61b4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

same question here...

> +#ifndef _XE_I2C_H_
> +#define _XE_I2C_H_
> +
> +#include <linux/bits.h>
> +#include <linux/notifier.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +
> +struct device;
> +struct fwnode_handle;
> +struct i2c_adapter;
> +struct i2c_client;
> +struct irq_domain;
> +struct platform_device;
> +struct xe_device;
> +struct xe_mmio;
> +
> +#define XE_I2C_MAX_CLIENTS		3
> +
> +#define XE_I2C_EP_COOKIE_DEVICE		0xde
> +
> +/* Endpoint Capabilities */
> +#define XE_I2C_EP_CAP_IRQ		BIT(0)
> +
> +struct xe_i2c_endpoint {
> +	u8 cookie;
> +	u8 capabilities;
> +	u16 addr[XE_I2C_MAX_CLIENTS];
> +};
> +
> +struct xe_i2c {
> +	struct fwnode_handle *adapter_node;
> +	struct platform_device *pdev;
> +	struct i2c_adapter *adapter;
> +	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
> +
> +	struct notifier_block bus_notifier;
> +	struct work_struct work;
> +
> +	struct irq_domain *irqdomain;
> +	int adapter_irq;
> +
> +	struct xe_i2c_endpoint ep;
> +	struct device *drm_dev;
> +
> +	struct xe_mmio *mmio;
> +};
> +
> +#if IS_ENABLED(CONFIG_I2C)
> +int xe_i2c_probe(struct xe_device *xe);
> +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> +#else
> +static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
> +static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5362d3174b06..c43e62dc692e 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_hw_engine.h"
> +#include "xe_i2c.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_pxp.h"
> @@ -476,6 +477,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  			if (xe->info.has_heci_cscfi)
>  				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
> +			xe_i2c_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>  		}
>  	}
> -- 
> 2.47.2
> 

