Return-Path: <linux-i2c+bounces-11539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBA0AE2005
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 18:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7511888C7E
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jun 2025 16:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2303526E708;
	Fri, 20 Jun 2025 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0AMD9BX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0F1993BD;
	Fri, 20 Jun 2025 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750436552; cv=fail; b=RTdqiooLuK+q9xMOYMKbbvPyw3le8xjUgBUu7NIB1efqX/513oVQprCuuukgF5Y2DmqfqPqWA4lLkbH0Hi+aaTCOODKGSy02drzfLZoFCMsIMpA8JGSq+1KGl8eoybeyU4Eu7fH+qQ3E12nTdvK6L5J59FfLm0b+CNn1VbzI1Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750436552; c=relaxed/simple;
	bh=I9emmxrOBDeMWWAYJN0B/x6zUH7siAFuWCJu8Adx/z0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C7IHIJ4gkwocrmvNOGtCpdBfEvaXm9tPzZwTRpL7ujEMaHjbfJJPBYF2T++lAI1fx0POFwghIKWcTbpGglDB2OI9fHjRlWUTy/CXWCNQfIIPMCXSZB8FwsmgI24P3GwNEoqULcukFQRYtF4XTtXzQiJeZfRfh+KqEI4gUtTtnOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0AMD9BX; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750436550; x=1781972550;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=I9emmxrOBDeMWWAYJN0B/x6zUH7siAFuWCJu8Adx/z0=;
  b=G0AMD9BX1+7R2LdKBTmBJ/vrtDeyFaAYYAPB7Z2kNctzMhsGziv5u0Gm
   AuUfgUSmdV+yWuyjQTAAz9o9RFJzl7AeZOrX7kR7Sy6cl6K/x9jjLASiu
   rVoRIrQ2JrHkjKr4D1aLvKKKHf3rM8Oa5usYA4+J62B2gfCOuGGEX4YrO
   lLDl5SW1QngMIkTCypaSKAPwaQzMRE+KUic/VAiNBqj45kCx277Z+RpAi
   p8Nm1dG3gdY8RTPpO/22SeNr3ZH79EmMFHNYjTlK2pT9jHIQTyBPPrKH/
   eU4EPRFbi/ckquh4NrAeK6jd2mJk2pRAN+z1Un7+pO0w9gzdyEW2tfV0v
   w==;
X-CSE-ConnectionGUID: 0RotcV4eRx+4za3azRovEA==
X-CSE-MsgGUID: DrOgrHuCTW6O+QQTfByx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62977526"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="62977526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 09:22:29 -0700
X-CSE-ConnectionGUID: pcjpq8w5ReGyzxy+op3J7A==
X-CSE-MsgGUID: A7mELejXQzakVIVzn0DoUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="181979324"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 09:22:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:22:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 09:22:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 09:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS1M8aeUR3l/HAPKrrymVtXTYkLIFqP3PFiysTYH8RCy1Fuv7VCGfm68KWplJWo8IWNgBxywn/2KmM1OKhNZ560Sn0iPKS8Z/vWHLi0qyPfSNaRcsi1cILM1dNSe/UVP8fAKQJ4Di24rhQQrzgQuCeswJ9XbTa+swdw8SMGSPs005h1fRmXqSUQ2jhUZeiC+qCclWbPALu6Nl6iMTMGvMpRYjFCvdLFiLa7yUhzzymAOtaUs0nrfrASMppWV+Bel+gQTqoCW3ja5TcSDYx8MvWhjfVujchIr3hNG0iYfLhBLAGUU1tN1jL13g1SnJSZne7e2eJdbVrDlNxeu64WDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU8VEuwSua/jf4CsEBrr6dMf1r713q7JijSp2xsCBFc=;
 b=JedFfs6+7nAMQoMdfFTdbKZexRxJ8jHAA321t5jjlfoU1OBMGNwMcPCZ6lpPtQ2Qb4Jp4/9akUc+U94VJsk+aG1S3/tLSpMnretNMHhZ4HrMnZWqWlZRqddAL5AYJKM5VLp3pTLUbuv7AQBBxkZ2YhTrwM3XZeMkS5iuwQt6n56yxRBDiM3NdZjAR809NSJCtRtu+t3fhxDykDsvn6WK6xPa3gYQD04q+BACvpnZbC5ZiDaOe5jNtF5qV/ADE+PZ5aCnZQ7DpopdhR5nFVHFHMKXO4HxYsJEOoZ3s/U+0z2/0eYKaoEy3OfSjSu5lR1/39ZySudb+nCgvUumeUDwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 20 Jun
 2025 16:21:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 16:21:57 +0000
Date: Fri, 20 Jun 2025 12:21:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Michael J. Ruhl"
	<michael.j.ruhl@intel.com>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Lucas De Marchi
	<lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
	<thomas.hellstrom@linux.intel.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi Shyti
	<andi.shyti@kernel.org>, Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana"
	<riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	<intel-xe@lists.freedesktop.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aFWKnOKTNOqcbTCx@intel.com>
References: <20250612132450.3293248-1-heikki.krogerus@linux.intel.com>
 <20250612132450.3293248-3-heikki.krogerus@linux.intel.com>
 <aFB-y_bObI8LZvzp@intel.com>
 <aFFRMIvChfQI3dND@kuha.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFFRMIvChfQI3dND@kuha.fi.intel.com>
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c0ccbd-03f6-4fba-efeb-08ddb0169380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UY66gYhPnPuiLhalTuEoGyUbrPigD30lyMyomNQVLIpw5YyK8Bf3x9aafBFI?=
 =?us-ascii?Q?n4gYJ46gHVeL8nREIl3XBEMJ1uy1K4vQK2YNXs9cCY3Uem1yz1ARZlVrlM8p?=
 =?us-ascii?Q?QwbisuC+w0p1yLq0Sj3ccu6WY1iwwYx2rqrh9FPUW8xFcHS2YIGsWuqweFv0?=
 =?us-ascii?Q?6f9gGPtllLFsdUeQnIRtSg4hSIHBHWNpQuHkx1SkI+R7uKszFtH2xliPURea?=
 =?us-ascii?Q?HLulw6+DybBIdW9SdRzI72zbnpTf9DCpdCr6aDvUUgDW8YgHr7xll7H3soRJ?=
 =?us-ascii?Q?oMdBk4RdQHwohlAGZZfrcqbKuMuhYuwrkJM5x2f0arpJYggL230kM2bTJX5K?=
 =?us-ascii?Q?DvTaxd1+G28fiUNAhRLyE5KDjt/uyd0dvbyeb9pxAdPetwsXBEQDUzSwf/FB?=
 =?us-ascii?Q?Vcthr8dvD7vKE0MCeLZk+kLuXkQox+0H8x6FKRP4+Vc5/Sv59DFB2FAqN0d6?=
 =?us-ascii?Q?F4Bu2cQo2eE0bYPRbLEsM5oPlyQm7uPjjQZGNKyV0YX46qf5AGDswxsECpwD?=
 =?us-ascii?Q?HxnXHkg97niGcKpKY2wLiC8wkOE5m1e4nYiqjOL2nkI8sKIxgB+Jd3VD5IDx?=
 =?us-ascii?Q?iXrYPXYe7Gt5YLAmbxdfhX8nfcNLl8q9S51q40iZkEwCHoD1R/twVdBuzKFh?=
 =?us-ascii?Q?CLa8sgP1NYw3vmYnVpWdr2kB8ZAFIFlll/aeBwWpzv3jGd+E5s2jJhWEdEjr?=
 =?us-ascii?Q?1sIsY76Mnd9Z6++iNF2NMZOLNEEOfAC/8aCDuwHCsOJUyaoIvYop0rYTinZn?=
 =?us-ascii?Q?2+1im7CVMhULgXjDWKT6w8XGEticCRWD+kNxaNp+4hKLZOcFhXiGQRoxVe3W?=
 =?us-ascii?Q?Wfeh9VsBWrvBIVBxJYbhC29GqvBsct8O6vSs0Cgz3Cj31KkB3go61bTezi+H?=
 =?us-ascii?Q?GzAZv73qIUi3V4rBe4SYKQjpIDUcY575GnamlE4qak6bI6qiZHJFeKrraWRV?=
 =?us-ascii?Q?S9ttEcFwspJBt69xHgsSuN5TdfwS30knEVdm1U1QW8t4i4XxUuPy4yp+n5Hs?=
 =?us-ascii?Q?eVChmJA4GKJlpcrZVR9w0af282BIGw2BR0jsRwHtas36I8g/nKh3O7DNb/FZ?=
 =?us-ascii?Q?N+aDTxqIVgTYA3mDYTQFGHa21BNUXdszYGECoTY/wjKLxzywGhParJZPcoTp?=
 =?us-ascii?Q?4EUkT7ncpfIfvw+2S+x39+4dEVPoCz9z9o5seOxBJVBEK94TNewiyqdQ6+h6?=
 =?us-ascii?Q?EZplPtez/pFrEORfBCK0rPlc/5IQ500ADxJH8Rm5yt7Bx/eZOwoNqMfvNeKZ?=
 =?us-ascii?Q?kY9nUe/VUNAZAq6LsW1dKBSFc8KMwadE6lpeOgNIunwjkX43PvX3G56eh8sq?=
 =?us-ascii?Q?zlU9YXrufr/Po+mc1BnWXxJYIdCawwqfXzCzF+XauPSWLZFJ93C0xLtHtRGt?=
 =?us-ascii?Q?eymZYwM9nDaeBlnAwGayWO0u4IlQc6Pbb9BidAD8d/jJGdHA7h/YDNhWn6Yd?=
 =?us-ascii?Q?l+xc9UUBar4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nNzTwtFNrj0hQ7P9HKUxyZROb1LH/o3+1zdVdiwtJ7b5m6h3d/nLQlU7WTZH?=
 =?us-ascii?Q?S6cSlXIq39iMAEseGnJQ84VdXYyfUyUl3SifGeBxRhLkiweKLpfebq/ZxT5p?=
 =?us-ascii?Q?C3cXSJ6wDcDFas6UyqiP5y+S7DsXhsUQUd6yH5cMVkNDlB0yAu7RrfnSeAg6?=
 =?us-ascii?Q?yE2IrSVdwrxM0lo42KzLsQi+g68RqupAFkLoG08EQAozedw4nZvijAQegGOb?=
 =?us-ascii?Q?SrjZVE3nXd3n/P66GHKuUXEIpZKva5WYzqZuCxWFK8dDaayWb6Hbf+AfmGs2?=
 =?us-ascii?Q?bASBRFMcSg1t7kflm5IGDoGDM8LZoFt2wJ2ckPR3mcVfW1Zp3j+qpRRU6yZ0?=
 =?us-ascii?Q?J6TVjIbE2ZA3mPHbFmK5JGpoSI1/Rc0yo4Xc3nWqgiuFinnSc9l5maHubnVf?=
 =?us-ascii?Q?ReM4+DElnxKgv9HwjaOL7oLQPAxWqvVTSfqo3CvdOi/GNOmkrnlCRaL6qSni?=
 =?us-ascii?Q?bpbPzFGRPOR53290syWA0EsPsj4QyRsGlUkMw9EpsjGJCW7rveXeN0/w2oEI?=
 =?us-ascii?Q?8eFgJo+RkVLveq9Dg3v7RhZnx7CMC6gqryGQOIlar3VQvQipqvQj/eMjTDFc?=
 =?us-ascii?Q?AC6r4xijGxJrFXfjUm7JZeUr8xKsGBM08YaqQW4pnPX9dQ0BGdlltoKALIRp?=
 =?us-ascii?Q?/D//evoou5lODIiPSmD/rxNSaOxNhzK5cpfV0/ZHUEbsuLrCxFI5UcRmQkvv?=
 =?us-ascii?Q?MEC1Ctzi1ncwcT+8I/SiZq3YjjtSMgA9vb2TIasVH5dx30xO23YDpYcu/ZqO?=
 =?us-ascii?Q?SHEOET3NslcuL6FM/EESxEhtwXmgfEQDWI8dPeDcnsWTB4QG776oVHVqMvEO?=
 =?us-ascii?Q?3sQtBPSKzwwjAdjryvUEej5UTnMcBPnXTf3k+8dLhTLFgVnkVuDFDH7mNdTh?=
 =?us-ascii?Q?UyKQOcyVG9zu2r9SL5DfxHHyzWQEdSYG5UfBIfD9oL8KGNH0gRMnR8Q54G8b?=
 =?us-ascii?Q?o8J5Nbtp9fI5qTkXl6DxmUzpcRkyC3Qog8mqbgPHSsNdYKNGGxcELkbseYq1?=
 =?us-ascii?Q?Qr961SnKz/aJmcTLSAlXjsImbMOwqadYL3j7xj6qxtcJaCGvCnfH9k5S7wcL?=
 =?us-ascii?Q?0mLwFvjX3P3BsG8FueZa8MzsNC0eJGIlR+sjzzUKfwyDVkTiadyRN2idSNCp?=
 =?us-ascii?Q?Rxm8XPdo6j3tS5nZ1leQ9sYdGgnKXXeL9JZxX3T5mSNoOgR4AAYDwLP7zNXs?=
 =?us-ascii?Q?3SzOYN4gFiTquZOWavSO5wJoykNb7HyerIZtJVqhGgAxPobOCkwyzeDfgODN?=
 =?us-ascii?Q?exwQxQhV3lfUtb0GsmkXL6TAKWu4h26XAIDlq2/x/icJ0OX+PZN4BwChnnb6?=
 =?us-ascii?Q?vp8pF4s9U7V3GhuQZAo5hXlh9rnzQUr84wawDNa1FzxLs0wqoP1lEbg3xMRZ?=
 =?us-ascii?Q?ljQn40zr8YQrkDiWAu1PbE+RPqCcMzEiiWvxEh43IO/+hBQ1OSLb2gm/Sozu?=
 =?us-ascii?Q?qNp4oTyFf1/cax6VSko0mBjAkzaTRAAnIVWskg7phYTJjK4URXHcAXK8LoOf?=
 =?us-ascii?Q?4sJ4g0ftbpm8DgSyvQKBE4pIaEaWwS6udBApBSX+GLVZraSV+H4vSv8QfUmd?=
 =?us-ascii?Q?WMlkdtmQZeX77cUnu9cgaC3ANA8PcYU00u1Mu/O6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c0ccbd-03f6-4fba-efeb-08ddb0169380
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:21:57.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BlI5yiY8r91hwtDGs9Nh+13k+Hz74+C0WA9YuK6ZsncCWYPeVITLWdl88oMDtIG+UWm95ykPSOtwzkmAf15LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
X-OriginatorOrg: intel.com

On Tue, Jun 17, 2025 at 02:27:44PM +0300, Heikki Krogerus wrote:
> Hi Rodrigo,
> 
> Thank you for the review.
> 
> On Mon, Jun 16, 2025 at 04:30:03PM -0400, Rodrigo Vivi wrote:
> > On Thu, Jun 12, 2025 at 04:24:48PM +0300, Heikki Krogerus wrote:
> > > Adding adaption/glue layer where the I2C host adapter
> > > (Synopsys DesignWare I2C adapter) and the I2C clients (the
> > > microcontroller units) are enumerated.
> > > 
> > > The microcontroller units (MCU) that are attached to the GPU
> > > depend on the OEM. The initially supported MCU will be the
> > > Add-In Management Controller (AMC).
> > > 
> > > Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Kconfig            |   1 +
> > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > >  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  15 ++
> > >  drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
> > >  drivers/gpu/drm/xe/regs/xe_pmt.h      |   2 +-
> > >  drivers/gpu/drm/xe/regs/xe_regs.h     |   2 +
> > >  drivers/gpu/drm/xe/xe_device.c        |   5 +
> > >  drivers/gpu/drm/xe/xe_device_types.h  |   4 +
> > >  drivers/gpu/drm/xe/xe_i2c.c           | 270 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_i2c.h           |  58 ++++++
> > >  drivers/gpu/drm/xe/xe_irq.c           |   2 +
> > >  11 files changed, 360 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_i2c.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index c57f1da0791d..5c162031fc3f 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -44,6 +44,7 @@ config DRM_XE
> > >  	select WANT_DEV_COREDUMP
> > >  	select AUXILIARY_BUS
> > >  	select HMM_MIRROR
> > > +	select REGMAP if I2C
> > >  	help
> > >  	  Experimental driver for Intel Xe series GPUs
> > >  
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index f5f5775acdc0..293552fc5aaf 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -124,6 +124,7 @@ xe-y += xe_bb.o \
> > >  	xe_wait_user_fence.o \
> > >  	xe_wopcm.o
> > >  
> > > +xe-$(CONFIG_I2C)	+= xe_i2c.o
> > >  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> > >  xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
> > >  
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > > new file mode 100644
> > > index 000000000000..fa7223e6ce9e
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> > > @@ -0,0 +1,15 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef _XE_I2C_REGS_H_
> > > +#define _XE_I2C_REGS_H_
> > > +
> > > +#include "xe_reg_defs.h"
> > > +#include "xe_regs.h"
> > > +
> > > +#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
> > > +#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
> > > +#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)

nit: could be sorted out starting with lower offset (bridge)

> > > +
> > > +#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
> > > +#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)

why is this named cookie and address?
Shouldn't it be REG_SG_REMAP_ADDR_PREFIX and REG_SG_REMAP_ADDR_POSTFIX ?

> > 
> > Could you please send me some pointers of the spec for this registers
> > so I can help on the review here?
> 
> Done.
> 
> > > +
> > > +#endif /* _XE_I2C_REGS_H_ */
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > index f0ecfcac4003..13635e4331d4 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > @@ -19,6 +19,7 @@
> > >  #define   MASTER_IRQ				REG_BIT(31)
> > >  #define   GU_MISC_IRQ				REG_BIT(29)
> > >  #define   DISPLAY_IRQ				REG_BIT(16)
> > > +#define   I2C_IRQ				REG_BIT(12)
> > >  #define   GT_DW_IRQ(x)				REG_BIT(x)
> > >  
> > >  /*
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> > > index b0efd9b48d1e..2995d72c3f78 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> > > @@ -5,7 +5,7 @@
> > >  #ifndef _XE_PMT_H_
> > >  #define _XE_PMT_H_
> > >  
> > > -#define SOC_BASE			0x280000
> > > +#include "xe_regs.h"
> > >  
> > >  #define BMG_PMT_BASE_OFFSET		0xDB000
> > >  #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > index 3abb17d2ca33..1926b4044314 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > @@ -7,6 +7,8 @@
> > >  
> > >  #include "regs/xe_reg_defs.h"
> > >  
> > > +#define SOC_BASE				0x280000
> > > +
> > >  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> > >  #define   DRIVERINT_FLR_DIS			REG_BIT(31)
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 7e87344943cd..ca098ed532b5 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -42,6 +42,7 @@
> > >  #include "xe_guc.h"
> > >  #include "xe_hw_engine_group.h"
> > >  #include "xe_hwmon.h"
> > > +#include "xe_i2c.h"
> > >  #include "xe_irq.h"
> > >  #include "xe_memirq.h"
> > >  #include "xe_mmio.h"
> > > @@ -921,6 +922,10 @@ int xe_device_probe(struct xe_device *xe)
> > >  	if (err)
> > >  		goto err_unregister_display;
> > >  
> > > +	err = xe_i2c_probe(xe);
> > > +	if (err)
> > > +		goto err_unregister_display;
> > > +
> > >  	for_each_gt(gt, xe, id)
> > >  		xe_gt_sanitize_freq(gt);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index ac27389ccb8b..8f3c5ea58034 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -33,6 +33,7 @@
> > >  struct dram_info;
> > >  struct intel_display;
> > >  struct xe_ggtt;
> > > +struct xe_i2c;
> > >  struct xe_pat_ops;
> > >  struct xe_pxp;
> > >  
> > > @@ -573,6 +574,9 @@ struct xe_device {
> > >  	/** @pmu: performance monitoring unit */
> > >  	struct xe_pmu pmu;
> > >  
> > > +	/** @i2c: I2C host controller */
> > > +	struct xe_i2c *i2c;
> > > +
> > >  	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> > >  	u32 atomic_svm_timeslice_ms;
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > new file mode 100644
> > > index 000000000000..3d649602ede8
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > @@ -0,0 +1,270 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > 
> > Does it really need to be GPL or could it be MIT?
> > 
> > (If you copied code from other files that are GPL, then it needs
> > to be GPL)
> 
> Michael, do we need to use GPL here, or is MIT okay?

Mike?!

> 
> > > +/*
> > > + * Intel Xe I2C attached Microcontroller Units (MCU)
> > > + *
> > > + * Copyright (C) 2025 Intel Corporation.
> > > + */
> > > +
> > > +#include <linux/array_size.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/ioport.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/irqdomain.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/sprintf.h>
> > > +#include <linux/string.h>
> > > +#include <linux/types.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +#include "regs/xe_i2c_regs.h"
> > > +#include "regs/xe_irq_regs.h"
> > > +
> > > +#include "xe_device.h"
> > > +#include "xe_device_types.h"
> > > +#include "xe_i2c.h"
> > > +#include "xe_mmio.h"
> > > +#include "xe_platform_types.h"
> > > +
> > > +/* Synopsys DesignWare I2C Host Adapter */
> > > +static const char adapter_name[] = "i2c_designware";
> > > +
> > > +static const struct property_entry xe_i2c_adapter_properties[] = {
> > > +	PROPERTY_ENTRY_STRING("compatible", "intel,xe-i2c"),
> > > +	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
> > > +	{ }
> > > +};
> > > +
> > > +static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
> > > +{
> > > +	u32 *val = ep;
> > > +
> > > +	val[0] = xe_mmio_read32(mmio, CLIENT_DISC_COOKIE);
> > > +	val[1] = xe_mmio_read32(mmio, CLIENT_DISC_ADDRESS);
> > > +}
> > > +
> > > +static void xe_i2c_client_work(struct work_struct *work)
> > > +{
> > > +	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
> > > +	struct i2c_board_info info = {
> > > +		.type	= "amc",
> > > +		.flags	= I2C_CLIENT_HOST_NOTIFY,
> > > +		.addr	= i2c->ep.addr[1],
> > > +	};
> > > +
> > > +	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
> > > +}
> > > +
> > > +static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
> > > +{
> > > +	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
> > > +	struct i2c_adapter *adapter = i2c_verify_adapter(data);
> > > +	struct device *dev = data;
> > > +
> > > +	if (action == BUS_NOTIFY_ADD_DEVICE &&
> > > +	    adapter && dev->parent == &i2c->pdev->dev) {
> > > +		i2c->adapter = adapter;
> > > +		schedule_work(&i2c->work);
> > > +		return NOTIFY_OK;
> > > +	}
> > > +
> > > +	return NOTIFY_DONE;
> > > +}
> > > +
> > > +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> > > +{
> > > +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> > > +	struct platform_device *pdev;
> > > +	struct fwnode_handle *fwnode;
> > > +	int ret;
> > > +
> > > +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> > > +	if (!fwnode)
> > > +		return -ENOMEM;
> > > +
> > > +	/*
> > > +	 * Not using platform_device_register_full() here because we don't have
> > > +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > > +	 * uses that handle, but it may be called before
> > > +	 * platform_device_register_full() is done.
> > > +	 */
> > > +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> > > +	if (!pdev) {
> > > +		ret = -ENOMEM;
> > > +		goto err_fwnode_remove;
> > > +	}
> > > +
> > > +	if (i2c->adapter_irq) {
> > > +		struct resource	res = { };
> > > +
> > > +		res.start = i2c->adapter_irq;
> > > +		res.name = "xe_i2c";
> > > +		res.flags = IORESOURCE_IRQ;
> > > +
> > > +		ret = platform_device_add_resources(pdev, &res, 1);
> > > +		if (ret)
> > > +			goto err_pdev_put;
> > > +	}
> > > +
> > > +	pdev->dev.parent = i2c->drm_dev;
> > > +	pdev->dev.fwnode = fwnode;
> > > +	i2c->adapter_node = fwnode;
> > > +	i2c->pdev = pdev;
> > > +
> > > +	ret = platform_device_add(pdev);
> > > +	if (ret)
> > > +		goto err_pdev_put;
> > > +
> > > +	return 0;
> > > +
> > > +err_pdev_put:
> > > +	platform_device_put(pdev);
> > > +err_fwnode_remove:
> > > +	fwnode_remove_software_node(fwnode);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
> > > +{
> > > +	platform_device_unregister(i2c->pdev);
> > > +	fwnode_remove_software_node(i2c->adapter_node);
> > > +}
> > > +
> > > +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> > > +{
> > > +	if (!xe->i2c || !xe->i2c->adapter_irq)
> > > +		return;
> > > +
> > > +	if (master_ctl & I2C_IRQ)
> > > +		generic_handle_irq_safe(xe->i2c->adapter_irq);
> > > +}
> > > +
> > > +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> > > +			  irq_hw_number_t hw_irq_num)
> > > +{
> > > +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct irq_domain_ops xe_i2c_irq_ops = {
> > > +	.map = xe_i2c_irq_map,
> > > +};
> > > +
> > > +static int xe_i2c_create_irq(struct xe_i2c *i2c)
> > > +{
> > > +	struct irq_domain *domain;
> > > +
> > > +	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
> > > +		return 0;
> > > +
> > > +	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
> > > +	if (!domain)
> > > +		return -ENOMEM;
> > > +
> > > +	i2c->adapter_irq = irq_create_mapping(domain, 0);
> > > +	i2c->irqdomain = domain;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> > > +{
> > > +	if (i2c->irqdomain) {
> > > +		irq_dispose_mapping(i2c->adapter_irq);
> > > +		irq_domain_remove(i2c->irqdomain);
> > > +	}
> > > +}
> > > +
> > > +static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
> > > +{
> > > +	struct xe_i2c *i2c = context;
> > > +
> > > +	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
> > > +{
> > > +	struct xe_i2c *i2c = context;
> > > +
> > > +	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct regmap_config i2c_regmap_config = {
> > > +	.reg_bits = 32,
> > > +	.val_bits = 32,
> > > +	.reg_read = xe_i2c_read,
> > > +	.reg_write = xe_i2c_write,
> > > +	.fast_io = true,
> > > +};
> > > +
> > > +static void xe_i2c_remove(void *data)
> > > +{
> > > +	struct xe_i2c *i2c = data;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> > > +		i2c_unregister_device(i2c->client[i]);
> > > +
> > > +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > > +	xe_i2c_unregister_adapter(i2c);
> > > +	xe_i2c_remove_irq(i2c);
> > > +}
> > > +
> > > +int xe_i2c_probe(struct xe_device *xe)
> > 
> > could you please add some /** DOC: Xe i2c ... above
> > and then add some doc to the exported functions?
> 
> Sure thing. But just to be clear to everyone, there no are exported
> functions here (global but not exported).

sorry for my terminology confusion, but I meant global. Accessible by
other xe_ components. We try to keep all the internal abi documented
to help future developers touching the same code later.

> 
> > > +{
> > > +	struct xe_i2c_endpoint ep;
> > > +	struct regmap *regmap;
> > > +	struct xe_i2c *i2c;
> > > +	int ret;
> > > +
> > > +	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
> > > +	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > > +		return 0;
> > > +
> > > +	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
> > > +	if (!i2c)
> > > +		return -ENOMEM;
> > > +
> > > +	INIT_WORK(&i2c->work, xe_i2c_client_work);
> > > +	i2c->mmio = xe_root_tile_mmio(xe);
> > > +	i2c->drm_dev = xe->drm.dev;
> > > +	i2c->ep = ep;
> > > +
> > > +	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
> > > +	if (IS_ERR(regmap))
> > > +		return PTR_ERR(regmap);
> > > +
> > > +	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
> > > +	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = xe_i2c_create_irq(i2c);
> > > +	if (ret)
> > > +		goto err_unregister_notifier;
> > > +
> > > +	ret = xe_i2c_register_adapter(i2c);
> > > +	if (ret)
> > > +		goto err_remove_irq;
> > > +
> > > +	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
> > > +
> > > +err_remove_irq:
> > > +	xe_i2c_remove_irq(i2c);
> > > +
> > > +err_unregister_notifier:
> > > +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > > +
> > > +	return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> > > new file mode 100644
> > > index 000000000000..e88845be61b4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.h
> > > @@ -0,0 +1,58 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > 
> > same question here...
> > 
> > > +#ifndef _XE_I2C_H_
> > > +#define _XE_I2C_H_
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/types.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +struct device;
> > > +struct fwnode_handle;
> > > +struct i2c_adapter;
> > > +struct i2c_client;
> > > +struct irq_domain;
> > > +struct platform_device;
> > > +struct xe_device;
> > > +struct xe_mmio;
> > > +
> > > +#define XE_I2C_MAX_CLIENTS		3
> > > +
> > > +#define XE_I2C_EP_COOKIE_DEVICE		0xde
> > > +
> > > +/* Endpoint Capabilities */
> > > +#define XE_I2C_EP_CAP_IRQ		BIT(0)
> > > +
> > > +struct xe_i2c_endpoint {
> > > +	u8 cookie;
> > > +	u8 capabilities;
> > > +	u16 addr[XE_I2C_MAX_CLIENTS];
> > > +};
> > > +
> > > +struct xe_i2c {
> > > +	struct fwnode_handle *adapter_node;
> > > +	struct platform_device *pdev;
> > > +	struct i2c_adapter *adapter;
> > > +	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
> > > +
> > > +	struct notifier_block bus_notifier;
> > > +	struct work_struct work;
> > > +
> > > +	struct irq_domain *irqdomain;
> > > +	int adapter_irq;
> > > +
> > > +	struct xe_i2c_endpoint ep;
> > > +	struct device *drm_dev;
> > > +
> > > +	struct xe_mmio *mmio;
> > > +};
> > > +
> > > +#if IS_ENABLED(CONFIG_I2C)
> > > +int xe_i2c_probe(struct xe_device *xe);
> > > +void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> > > +#else
> > > +static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
> > > +static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> > > +#endif
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > > index 5362d3174b06..c43e62dc692e 100644
> > > --- a/drivers/gpu/drm/xe/xe_irq.c
> > > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > > @@ -18,6 +18,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_guc.h"
> > >  #include "xe_hw_engine.h"
> > > +#include "xe_i2c.h"
> > >  #include "xe_memirq.h"
> > >  #include "xe_mmio.h"
> > >  #include "xe_pxp.h"
> > > @@ -476,6 +477,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> > >  			if (xe->info.has_heci_cscfi)
> > >  				xe_heci_csc_irq_handler(xe, master_ctl);
> > >  			xe_display_irq_handler(xe, master_ctl);
> > > +			xe_i2c_irq_handler(xe, master_ctl);
> > >  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> > >  		}
> > >  	}
> > > -- 
> > > 2.47.2
> > > 
> 
> thanks,
> 
> -- 
> heikki

