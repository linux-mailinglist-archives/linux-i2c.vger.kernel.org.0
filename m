Return-Path: <linux-i2c+bounces-11793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B7AF6465
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 23:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AF547A2616
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 21:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A71F23F40C;
	Wed,  2 Jul 2025 21:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/fohDwe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A62DE704;
	Wed,  2 Jul 2025 21:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493169; cv=fail; b=JkFwrmRJXxmI4AMZE+R91kQ7AsJq5wQmf8k0poQb++W/L2zabLkR+MlUiQjvaIiKcSk29+Z/2yYV9dHXUmj+7OEKzs9UPmKYxkM40aVl5YtpFixxb5VlxQdUssRVw/r46azrEQZi/yZ3OcRlBXevEGZ5BvefZX0uTAlIGobqORc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493169; c=relaxed/simple;
	bh=UIIC6hlwXgEeW1cfqUIZckL1EyPUt23gEIJ/EFIR7HE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JpDUuIfTZKEMDxjVQF9cyDQK0Zv+ufxSwSQlrLaiqMqdiHzWHEwLIXWgA1+zcDUTEXeXssCCooGf4fDl8TyPXMSvFsua5Bnfgi5dL/ExlmDT00A9XK24yEMS4276MhWQDVolAlXNuvS65+wuk6ogJKajN5MZO4sbfuyYS8PEpNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/fohDwe; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751493167; x=1783029167;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UIIC6hlwXgEeW1cfqUIZckL1EyPUt23gEIJ/EFIR7HE=;
  b=D/fohDweJvMThD700SNAEdz0sb3IqRFElJbWVOJ4Q6eEcxw3nuxA+U9j
   UnNK+hbHP9exebpJZrtZ1eAdA8dte+sDrLM6odAY/xk/EcJ/zbu6CD0Sz
   xpNwib7N7ZGtsWWRjvrsVvu/bFaHFD46ZLu7iWOVYRIxspXsHKoBIGiZ4
   wBY6oYC5k7t31InJa2QQAKYS1PB8KLknF5u+56tI9ES4HnPy7qPL7HcXC
   RltyqTW7ovIucfNcwsK/1mgc/7cNgGmgAwx3XaJPfd5FtEhO1Z+GVTZkz
   2VtC9LWO2ewfv4QqA3A2uPwuWTaF6cZmNl0WAgYFGaGCY9Oolw/zbT9VM
   w==;
X-CSE-ConnectionGUID: +qAZP0/RQfWidSSzDCgsMA==
X-CSE-MsgGUID: lUwg39QgSK+z3XjN5UB9MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53679980"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53679980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:52:47 -0700
X-CSE-ConnectionGUID: QpsU2+tiTueewTBf40E+Gg==
X-CSE-MsgGUID: gYwBjZ1qS4KpeZaxo8CyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="158230381"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 14:52:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:52:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:52:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:52:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXs+0rHRWmP0Z8jyUQCKKax8ImdlbDRVT8JF661tmTSiidrMUZIu2nW/8IbTvc0rcZ28QgtfUcHBVoPXs+wZunxQkz/FWqSVRC2064LjreDhNf1HJJkjI37cMpLizK8FxpQ1QRjfflbRCZrFyQm6VGKrdGIb1bdQa+DnLBJ9xDmRAr0UBdEtbEBjivlXYX9o9rzBIwZRL3JInGQVTBt4i0rZmqaLZvbz4CD/VKHdvYDjA++Mzmu40eTUZoRLLM2HnmDZwRo/hGP3aw1ZIdCRs0M9gOffkZf+8R2c9sxmckDVNcQah4vv77r795y5WW5HrOwQBPBJZ2Une4we7xpGIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCsBBgNTb38VM7q2+1GRjmFpSoY4TDYwsqjq0l4llME=;
 b=qeXuvC3kWBclnt7yJbO7u/ed0/VyBk7EhwYKWTwWOtD3zb9XgO2T5LLs/dK1BHgZjH1eZj/YOPfEa2u6MKXsE1Ke81Dq1PlnFcY0gmGZ0tJH81PyinA6w2+GgZcMVKWb771enNFP06VsWy6/CZTZo0CpnZ/4SbS/0sJrmWYuLiHph9QiKfS2CX5uBlfut3MErYu7ZXsqUqW42GJ3nfJWPyJ2Ab2wv8pXAO1/bvlSRfEMl21z6KZ+UczFk1nnF/2meq3B7su4O1xcAoOPMFbFR9+EQ6nTtaAsNzUtNOZCebNryGeD8AO3Bw0YVhLaxQBisKuvW9EiKtQVGRIjGvbFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 21:52:16 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:52:16 +0000
Date: Wed, 2 Jul 2025 17:52:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lucas De Marchi
	<lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
	<thomas.hellstrom@linux.intel.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Raag Jadav
	<raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Adatrao,
 Srinivasa" <srinivasa.adatrao@intel.com>, "Michael J. Ruhl"
	<michael.j.ruhl@intel.com>, <intel-xe@lists.freedesktop.org>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/5] drm/xe: i2c support
Message-ID: <aGWqCfpcYUla6T2e@intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9b6111-1532-4b34-b39f-08ddb9b2b5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k+HiPtSnECcFPEALDTPyBvUeIa2oMHlXe9IwVe8nyNMk/zVGE8IVvjt4gGHs?=
 =?us-ascii?Q?rCl73UAekVP3SCYirfDHeqOTbgrTRn/RVdJWhOqC84aqkTfhTN4rGZLwmhkD?=
 =?us-ascii?Q?K30gl9DvUoRD694i+Ei5UUNXNn2k5A0Dc592dKY7IRvBYHWznpzpqAglo0d/?=
 =?us-ascii?Q?4LKPwh7Gb/SC7rVWSSO9LTtx24WRRiNPKRnimetkEiA7FJI9pOkuO7fotGDb?=
 =?us-ascii?Q?HmtZ4puUdVGyZiLjW5NCPFFc8YeFBhkZHHlXA/UbBhFyF9253z6IhdU5VhZC?=
 =?us-ascii?Q?TAxwf2gQfH2r78dVGQ+bimLBYU4P02X7jfFS8HaFMQTUaVKDhYDddgY8zEb/?=
 =?us-ascii?Q?ZT4OZMJrUZhcrwdwgZ6NBJjIW/pYTALaB1R6IAAzfqGLYkcKal7fwgWsoIYf?=
 =?us-ascii?Q?OY3JPyxNPFqbVYb3+eE9hIJdviNz/ERvobdPZi3vmc2IdHjVmst5r7EltM1z?=
 =?us-ascii?Q?FM0aDiNGmZ+jFAKk3K8HrVhJOtimXm6X7862sOxoqX/Jv8ffpQa/m8rNkyTm?=
 =?us-ascii?Q?Sz1J1R5CsdyKNNp5CO5Mimwi43GqsunmfHGgDzEWdm+8XdPTE/KZH4bMwwOD?=
 =?us-ascii?Q?mKl1g5IHKLKqpGMWfAJ/YDK4utU8duTAJCyaHLCSpvg7f5/aHT1vLVJFklaH?=
 =?us-ascii?Q?M7C2SS5rBDY4iBcer87SkLZdTXGUF8E5vLZt3xXiC0XwPASXF7KY59KpG5hU?=
 =?us-ascii?Q?KDSZuXk0UtfQ2A1q6kSGXTMf3gGhitTl6K+30TfG5Pe+WyPyO+XLs5ZJAaaC?=
 =?us-ascii?Q?lf1HCE19vzswM+awOOf2lmvQMBL2CgsqGWDpfrmEEZuKTwuf6BiKhvE1qjQI?=
 =?us-ascii?Q?t+TQGKypUQtadCQBShFzGM/IRxfKK3r59ZI4aJ41LVi2d3001RrV9RxJlmHG?=
 =?us-ascii?Q?P24CwlG2gQtymbh27cnZhmGQ+Kvxd1gZSVZSJ0u1wPZ/diwkR/iNvXs740Ry?=
 =?us-ascii?Q?eiaa/Bbg9YfFjcvDZAzjFg4WtHPZMKtjQm4RZ9zEOaltIEx1OOKozaqE5l4W?=
 =?us-ascii?Q?dDM+TXGhYkntuf8vSKfhHFdsPkUn0pcuZc64j+BbTaf43eLBxFHQqNmXqapA?=
 =?us-ascii?Q?fzU/J3UFrbO6ZG2/OLev6jCyEoAPFmEkSZQ88fxd7TqvYBkvnpQElok307J3?=
 =?us-ascii?Q?TqVLH8L8hK5ElinDH8qqGoJmMZEX5WfA3cZ2pVZbAUK4YeXzTX52DS4/FzPu?=
 =?us-ascii?Q?X0oD0D4Zckga2QFSV0U0mA4/AdcUVLG20UFTwClYFREX6ad1m+dnp+doTPJc?=
 =?us-ascii?Q?cGvsIbUBQCJd617b/muDF2u75Sp3yyfyDs4ve1P8QpANpZyYO6jCJMrLqsny?=
 =?us-ascii?Q?Ije0l6dKRiBFZafavEx/7Ck+hITzd9PYuzGkceMAjrNA2w8ksDb3uqozkGEv?=
 =?us-ascii?Q?am6SVUz8jrjlPp/yrs7p56frZVMhcHUF4+TaDgMlMV4N3b0Ult+Z8J7175Mg?=
 =?us-ascii?Q?+LRRBI+tbbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8427.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E11nRBAb3faFiUN7YC84NVs7MJkOhU8NFv0GxW5hV4vbuhOxyXRI26f0biVh?=
 =?us-ascii?Q?GrmGcRoeV4xJTlwIv9fwTx61PCGGvy7D2zm/JynD8BqEJA+wCGCY3bSyZISe?=
 =?us-ascii?Q?ZQmnFMnv9JqNxURbRE4zp/useo08tap+BqKZ/y5eCqCb/qb5rUUs0X1ggwPr?=
 =?us-ascii?Q?cJWQQ9I4ARFUo/grnyx+MbI77sARc9v/GjWpevOSgrbFKcSM6skHyQ4EzDeK?=
 =?us-ascii?Q?kVXHfQwLefAM7MwdW9ijpJodnEnmZt64I+Qs1rdVU7Vxbj1H+qls6JpTcP5r?=
 =?us-ascii?Q?NoVNkxGQ18l2m4k5jFI0ryFY/+ILSSsUSzDqqzmSyn4Zvf/bBLUjmuC8iNO7?=
 =?us-ascii?Q?0kiHUfN2tqqcJPCMfDRDs7mC/CDo1oaIA+sl0DFEkBihq/7MnrvBTSbgKg/3?=
 =?us-ascii?Q?Zjs6ni+RA7LIeB4j4YkOQKTLF4h9VClQxK3TFnasLGHpHmMMs2rnFslRghd5?=
 =?us-ascii?Q?rVnB28glcS7Pnts2SxdB2ogwNXIhFIAk4wr4kLQdoLXtP6BAPW4IWODhTR8u?=
 =?us-ascii?Q?0Zh2uYb+duOXsAtN9iCHrryOMEgvgyEM9fiU/0zFRYWVvHPGCzB7LMrF1X4F?=
 =?us-ascii?Q?qTQP0wttbxch0DmA/jy3BhRxCol3SjYdduVWPT8XEfQI+jnerKHByo7af19O?=
 =?us-ascii?Q?LToDjM055Ao3u+ZTc+VY+4WxqZFWhAx04+tvWlDtArW09TQulyksKoFDgYSn?=
 =?us-ascii?Q?I1P2cT67ZaVJYIVMdqiR4lonPseBCRZn24JScJzGot6rsfWkN8d15zpyzIs8?=
 =?us-ascii?Q?qcrLa5tazfnsFuDHPPu5d+y3NykHD6FvGu9iGmeSU8wJ5VMiG7ocgQKNd3xt?=
 =?us-ascii?Q?YKMBqVi6KI96fZ8WxPFUF6i4LYcShZRST9DQz6EGGE+dLcZBFQnANSFsEQP8?=
 =?us-ascii?Q?xiwV8c3iRiOrPjt530UiB157g/OHM/lZA2cRymwO+IcuLxwhbQM8xKch+8vr?=
 =?us-ascii?Q?54i7iRdfQXsY/thQbntpcvTIJz7I+kUf3SSs2LoymhrqMrtN6rON/VEvU9Qm?=
 =?us-ascii?Q?6zX1QrDOjQalqNhFiOfPnB4OffoRCMgo5ulcGxbvmvJ40lM5qkuVWwMpIryt?=
 =?us-ascii?Q?O10tS98fuQYHbM6YEnBPx4RdU3BRPQlHqPvqQxjXXoAxwbH8z99nibmiB3ll?=
 =?us-ascii?Q?1O5tAaYsZptqGstnvnE8unUiBSQpl7n4t7bSoAJk+aSfEtBjW18/AGys/cQr?=
 =?us-ascii?Q?jb7ShXP7X3AVj4zQOJeamhUSSL2Y2mgZ/siVQwbanBHG/FZnWD7MtJb8BZ8e?=
 =?us-ascii?Q?TNkP9h0KV0QRO2ywX35hsid7BGc1gzaiFD+xozWrT+KvFzLY3IduSYF8xN6/?=
 =?us-ascii?Q?dNoZsKK0stiX2iGnRag5iJMAB4WqSpzgFm2IohbSh1IZTSO7TxAo6bN5y+Le?=
 =?us-ascii?Q?oaUWDaf1HwcbG7qcG1C/sjU7tgcWIvasEwkm7K5Rt1WptRjDD27hFP4R6oCb?=
 =?us-ascii?Q?qXBkK7IBgmXglVYV8q7zLqR475hHRI5PBMw2T8t2NgcLNxx6HGMoCgEHmuoU?=
 =?us-ascii?Q?8fuS1AV0sbKiGINY277iQnK8ib4mmLbh9wkvYYSql+mVCsAWc1doPnaGpJH2?=
 =?us-ascii?Q?CP4HLZiXoOH23lWkbKz34947Xc33BpqhvU13SSE2I0ACJKw8BHw6oG/IoRID?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9b6111-1532-4b34-b39f-08ddb9b2b5c0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:52:16.3330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWfitFytvoFjj7o9X9w6aRa4oZkzGQE3xKVrlz2D6mi56N/d4nhxp4x0cO6uN59cGs1oCldgscBcQaOH4oReQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
X-OriginatorOrg: intel.com

On Wed, Jul 02, 2025 at 07:18:50PM +0200, Andi Shyti wrote:
> Hi Heikki,
> 
> > Heikki Krogerus (3):
> >   i2c: designware: Use polling by default when there is no irq resource
> >   i2c: designware: Add quirk for Intel Xe
> 
> I think you could have kept Jarkko's ack here. Up to you.
> 
> Anyone against me taking the two above already?

I was thinking about keeping Jarkko's ack and get all merged at
once in drm-xe-next.

But first we need the SPDX headers in .c files fixed...

> 
> Andi
> 
> >   drm/xe: Support for I2C attached MCUs
> > 
> > Raag Jadav (1):
> >   drm/xe/pm: Wire up suspend/resume for I2C controller
> > 
> > Riana Tauro (1):
> >   drm/xe/xe_i2c: Add support for i2c in survivability mode

