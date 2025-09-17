Return-Path: <linux-i2c+bounces-13017-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ADFB7E784
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 14:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 025945207DD
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Sep 2025 12:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3463016F8;
	Wed, 17 Sep 2025 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfeGFG1f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36E72E7BA0
	for <linux-i2c@vger.kernel.org>; Wed, 17 Sep 2025 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113198; cv=fail; b=eN3xX2Rio+6LNthbv6+JLdJRKoaS2efG9N0B4j+MWvV7nf5oq44G+fLplNVpmzjNAvo10weMi6jSSPqa17NJEGm3B3IOqv+OvVMKX/95C6gdV/DVR1QU5XFScHi2d4BOjgyVveKIxuRUbj+4heGDRBySiXatqM4BET0h06zdG8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113198; c=relaxed/simple;
	bh=HvjtyxhzXY1jsT20tJcOPLvhmz3XxKwliiKE+ZxfU3s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hb05JvvitcILwpxCfs0IGO3ii522vQ5xWxYfM8WNfFwzRm5tv7YbuGi1GrwiKjllXSVnUjARMMjFIkPAd1Rhas8Uy+iG/3lzIvo5WdaFN232qYsbM0jTc9WpJjouut5YPqueF4quvhvFntABpYtz8WDvrz9+iI86fgEqLGmbPkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfeGFG1f; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758113197; x=1789649197;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HvjtyxhzXY1jsT20tJcOPLvhmz3XxKwliiKE+ZxfU3s=;
  b=RfeGFG1fC4usNUC+YQ7nPWpf7ZnBSpwLNEtBPWfMqAuxgO8F1elseBIa
   zd7PGeXQFG2GDbjoR7psgI/F8rjV37WHB7bSEkcr55rD5kcsxkYUoXdqV
   ERgwAAPIJN1mAhD8kca5kAQKwd8bjJ++kkgvzRboa474lN+FZIjW8LX9P
   qROSz/6JgPnKbvfOqvxy67cdS02UTPJL9FdKS19EFpfOrAZF8LwwHuEYL
   xQg+uqJdb5bKfVKkCJ30ghAtqQOVb0J3QrE5uYhbEkhz5w2GqLTlDYLqk
   qVfj4CYrGpHqNzxI33QquTYcCcCYMA2Z1kzxOcioBURrQUZoSVO/W7t36
   A==;
X-CSE-ConnectionGUID: aftNKUXvRxS94NqeFPJrww==
X-CSE-MsgGUID: Ot1F5qezQUiUuXi3JCM+YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71842306"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="71842306"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:46:37 -0700
X-CSE-ConnectionGUID: xVlHHRTvSnWfwOU+3FIfqA==
X-CSE-MsgGUID: 0KYjuWwcTdWVjmGZ0vmHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="174837715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:46:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 05:46:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 05:46:35 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 05:46:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/EeRRpELewpDKbXMl34/yEBEjNjGy39e9xrQk6cvcWFzy2ute/stoIAcP4KBk16cOGxdl+FNEDkZLONG5q/NF85m1WE4iadbfADIzIUDhke41fRNF8h090eibtQrt8/6ggTDv/wADLu578o5esm5M9+tf+BC3OhtQVxa2Lb5rjEkRCyjZSGgEdC3j1ZD3V1cM3C+sYMUe/uyLldoo4JKTPEoN8xTZBDPialf4ic761aOYSy5uLcHaeI5j1Rkfd7kvAm2QttGlEbwDN6RTuivJZGsOI1nAlSOIKRqC/HHA/oGUiT2xHvDBBgyazFnfBMY8T2K6pTxfxSPkq5D9OStQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wluq2lmxfH8cd4pR9PKKRWeAei2h7xddPie10jjPbfs=;
 b=WkZetD96AA0bwrG7u4SAAHvRqpyfeCLfj/nmkCfEjcXLS+eTtLBCbr/iqHkiEpC5qLRowocPpdbsLjxBm88HLYvIqwO66sOMzO0YFta8HW9fAGtn+iTCKYOrIC1hhflHYGr7sklrYG9GArNlJpzQrFS5vLcvX1Iz7JhKnqBnz/dmSJhiEeyma8PG/WiUlJTka4TntgeKrQ6XUmOqfLNxkxQqq66AUg9UKZojnmxDNu3B0V3qYU97pvrTlgsUdnrUXupwe5ZeW/2MyaREomzSJvM9TJ1GH/W0P7490AY0Df+zfPuc6NTxujcHah9mUBf+3fMND9vXdlVQZ7edh8eXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 12:46:32 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 12:46:32 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Jean Delvare <jdelvare@suse.de>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: Recent i2c-designware initialization fix
Thread-Topic: Recent i2c-designware initialization fix
Thread-Index: AQHcJ8Ltbqe6vtJ7xEi2LyOmT3raMrSXUHjA
Date: Wed, 17 Sep 2025 12:46:32 +0000
Message-ID: <IA1PR11MB64188C2A7BC8ADEE6A6AED3BC117A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250917130450.50ff0db3@endymion>
In-Reply-To: <20250917130450.50ff0db3@endymion>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM4PR11MB6237:EE_
x-ms-office365-filtering-correlation-id: 8da04eca-8e09-432e-6066-08ddf5e83b06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?+5OSkBM/agdfTUwmSFcaY3D2jybmgvITd6FSrxdr2574DKQk8qwMHXEhMQHN?=
 =?us-ascii?Q?kTyxE+PSUeTpGzTGm36hj3s5KqR44Xf3rNW1Cnyp8B4AKOltvoEmp1HVgZJG?=
 =?us-ascii?Q?L5BcnrwKkARDR7Fuh9o6qkzraYT5L+9GBsatbUi3OBT1y3m2ekQkTHo/wRWX?=
 =?us-ascii?Q?1Te0A32xpjIs21be1DRXMay35481GENRTou9otF9mpcUQYpzzrP4Y48yeAD7?=
 =?us-ascii?Q?N2MLVgBifMHnuuZZcEoobpygoUfJ+wd0v3sqzUKozvJUUuhfgDcbWE45HTcQ?=
 =?us-ascii?Q?UvO5lGjcwSOO2K/jQ/CiTxG0ZkfrRgk2uA6AujaI/oZSOi2Iu8QhB+tvN5PT?=
 =?us-ascii?Q?tvy5+9McICWvymXrxBgdzAc1GQvIslmiXcZOG6VYYzIrNDxWubGKS9xqx897?=
 =?us-ascii?Q?vE9yVPXrFGe8COk/EpvPb5oOVjVmwiZ+PuwMpHaxGNRLID2mKmli444GRVpX?=
 =?us-ascii?Q?ybwrPoMiwGFZgPV12t9FdDulSFkcbheOYsKkqMRCBpTi/LIZ9/jTmLsOTzf5?=
 =?us-ascii?Q?ig20PLgYt3toYvlMYZkdrIUzjLz2sWJnb0tEwUAyutM6Em/H5q+Vb6aBzTZn?=
 =?us-ascii?Q?y84GvfV9H9Bo6PTtLsUP4/X4MAC1uWOEqfSdgvaZ2kVdyZ9Y1XB2JAICR3SE?=
 =?us-ascii?Q?6dMEnUlsaFiR+vrZuat1vYOluNXRAJkwyS4voSu/NuiTAUSHsk1pecHXr8jm?=
 =?us-ascii?Q?FF2Evxh87R0kmPnjkczf7iTr0z3AxpbmAuzFqA4BBTIAj1L/p+cFMM7X3Z68?=
 =?us-ascii?Q?0PH1lS/GNAQUZ6nYJg7728X8PifO3FqQ1mQjnVCtKrCPL7bewgLo0b2y5X6m?=
 =?us-ascii?Q?WxBj6WLZGxgBDaGdjQv5iNTE//TEtJiMwZaTyC/zD0EIGE/yfpQifzEmoKM0?=
 =?us-ascii?Q?cemo+4JylnTi9rPTnMRTNXxmO4fQHrONFcrUmtJVzoF6bMn2L4YJqHyJJsea?=
 =?us-ascii?Q?6gfqCuO20ojkAt1SRuQUxqy4mC3unBQkahpuSkXNgs2KbwwayguUEpbAKZf2?=
 =?us-ascii?Q?7DKzOhSX0Tk0RhdCQPHD5oz7EHe3vaE9dsLIAKMK1i1sKMYY9C5L+wgMzCWk?=
 =?us-ascii?Q?19f181yyCiGPv5x/dRc6rhPWAsLpuxSN61U3vdSEi4hW3Tig2qTnPXmObQA7?=
 =?us-ascii?Q?6FGRCeFp7zh7SjJgLEVaZ54UowBOAqcOnS0hfwDPADrW1iJwH7yOYMBj1lXn?=
 =?us-ascii?Q?EbFzpvrZtEXOf2AVB62xZcl08PNCkHYJsH8fWL/Y06VQMLbGT6QqSZAWEmJz?=
 =?us-ascii?Q?JmLcrmmTclstoVRqMS0QE/LdQ/2e898N6/blJY3DBqaSS7VJES4csBadaOYo?=
 =?us-ascii?Q?igpyCVpQW1QpxGhiH3C6aYDrryas+nz3mD+NE+0t14qFx+mXbo4lGyhOuq2B?=
 =?us-ascii?Q?uQ76qHSzWJ2q4JnyYKVqx3fCmezqr2HLfczRPfWrklRjAy/VgJq5eWxwpkbZ?=
 =?us-ascii?Q?CZJclyO7lXZ7OvqX66HE7EvwUK9q/Gbtk11AbqoGucTpt6G1BzykAlIiFx2O?=
 =?us-ascii?Q?OAp7ZL3jWkrSnEA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KuM+N4vUD8LLxwpwJH0OQ2zouiAa9/WaA4naQhLhwIbCT/5v1H1E0lYw4638?=
 =?us-ascii?Q?6ZGFo3+9sfcrXge8Dev6LHktDECdgwlC6h5Bc82YOzPjsbIdhE5wuvJzMDKs?=
 =?us-ascii?Q?9FJrSzliiTKBrL8+HkArqwThGxaXXISCH/+rPCckl6S/ekW4WNSC2V2XJKKl?=
 =?us-ascii?Q?Afb3k9PeK+hinq32U7PJJk4EifIJTmSQ9WB+03rasPcF3BlhOiEJPSuzfsGZ?=
 =?us-ascii?Q?FwJ9+GSbdMlSABC0w/47Iq4QbIaE2+2wHEYyB2KhtzCGbQMveAkNA91/aYyA?=
 =?us-ascii?Q?gDhiaEJiA1rpddhQ7C5l4T9OvNxdgIsvs2yLcts3Wh6ttUqEZEuhjO6npZtw?=
 =?us-ascii?Q?s40GQsXE6d96T6Ss1osb+l3mTIxZ5tbq/gR5BbvUtdvLgSLpzfp9a+UakfFe?=
 =?us-ascii?Q?rjHCst7FACKAP8+H1HgQ+6ldpewszkceVdhTPME2onwC17PClEI5vwdyXGq/?=
 =?us-ascii?Q?VYgLuoRn6NQA1ZQNum9igXIY1S8sxaTYaGMuwhlsCXXoTddwTjriLrazcxyo?=
 =?us-ascii?Q?ZfPinZ8JkFyivN7ApRYgMvJtI1PNWYq3jmAPPW1IcOX5YbmXk7ubGzB6LCnq?=
 =?us-ascii?Q?pRXs2/hSpPBAlapqPDGpuQ1O8PuGNrVBEc4ENqFnVwX9mfV41DqN8Y3zVKKw?=
 =?us-ascii?Q?+yJ0kWm3mowxMCLZgJlhErXf09HDHYgNWX5K24/k7EJWJyQJtATO8A9OOBjF?=
 =?us-ascii?Q?mNRm5sIWR1E8Oqi4TQbrj4eZVSPe/+RPiz3WCsYH9nIoyh4XAcz7V02xjFVM?=
 =?us-ascii?Q?pX/jfYbPepRIiqUTeruRRoMu5B3tsAc9tAQ9ata7yqzH9evuQWDHLpTzfDl4?=
 =?us-ascii?Q?MvJNc23oqiZEBHYsjMJFUONvL3rhNP9fqgjSXFGVCXh4v0Ty0rGphRqfonFA?=
 =?us-ascii?Q?DIVV8iTA4kjl+YaO/Ja5msX3bK2IFLK6dYyWS4SJlIBX7lqdUSSgiO5eVoa0?=
 =?us-ascii?Q?lQzbekisIKteUx3hitjd3JF9HEbmbRXCbzmsIdMqk3mfM8L3SohuuBsjZf4k?=
 =?us-ascii?Q?a4rB4p4AVTlt02XQYNNNs/eUgt1xAF2vTpAVxSOoJCClH9hVY36mufJPIy7o?=
 =?us-ascii?Q?jVmrSo104oKq/uhjp6m1HtyOga8TEz/AN7XjVSER6/mkeuRfvX+F4nG+M5Kd?=
 =?us-ascii?Q?PQms09fJpWncuPGNBgQKHvWHHA2tVot+1UF7fz4iscI2uCFJNxNes599ubK7?=
 =?us-ascii?Q?KrjlieUzkJzwGOZNAUE1+C3j26TsupG85On4aZIWitn3NczIrundxCmra7xn?=
 =?us-ascii?Q?QXTIF5fPln1YFUKNtZDbtrcW8YpVdtS6OUWNDVlUDN0hFU/XsWW+393OSOmD?=
 =?us-ascii?Q?mw2uTy9xHBW+yopDzR/wl6iJ1kmz3WRcrbmtEd9cL7riTb+EqfnG7S0NMCm+?=
 =?us-ascii?Q?/EHPEjf7FFVhaodM068Tj+QIqxg2B0dDrhUniVUo3tFk5xnmd8Rw0105t1Oz?=
 =?us-ascii?Q?WKVUsjZsE0HhrQfNW2Dvs6yaJOEf5zo8fVaV+7kLwS9fsM3XsUY1hYx98nUB?=
 =?us-ascii?Q?716JHT3dGOG5NVfTLLdcaUtjZ17omfPfbGP1TYNl862wHNumKHQfLTTLzA+I?=
 =?us-ascii?Q?SKQxLwMrVQwG7a5s4zy0UbGKlYO3ktTRBZ1peTKV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da04eca-8e09-432e-6066-08ddf5e83b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 12:46:32.7449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiOnn3evR+qCtOXcBsWZ663aGniSbj8/irDOMvFP7MR7K3et2l4z3iWzChGuhvl00BQa7bbEuCL+jnY6QX1xOSTd4CAKURzWkny5qQ6nE1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Jean Delvare <jdelvare@suse.de>
>Sent: Wednesday, September 17, 2025 7:05 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Andi Shyti
><andi.shyti@kernel.org>; Jarkko Nikula <jarkko.nikula@linux.intel.com>; Mi=
ka
>Westerberg <mika.westerberg@linux.intel.com>; Jan Dabros
><jsd@semihalf.com>; linux-i2c@vger.kernel.org
>Subject: Recent i2c-designware initialization fix
>
>Hello Michael,
>
>I have been looking into your kernel commit 3d30048958e0
>("i2c/designware: Fix an initialization issue"), as it received a CVE
>number (CVE-2025-38380), I was asked to evaluate the severity of the
>bug.
>
>I was not familiar with the i2c-designware driver so it took me some
>reading time to form an opinion on the matter. But after a careful
>review, my conclusion is that there was no actual bug in the first
>place. If I'm correct then CVE-2025-38380 is invalid.
>
>My reasoning is as follows:
>* struct dw_i2c_dev is allocated per-PCI device in i2c_dw_pci_probe()
>  using devm_kzalloc(), therefore all its members, including
>  dev->msg_write_idx, are initialized to 0.
>* The supposedly problematic code path is only taken if (dev->flags &
>  MODEL_MASK) =3D=3D MODEL_AMD_NAVI_GPU.
>* The only place where dev->msg_write_idx is set to a non-zero value is
>  in i2c_dw_xfer_msg(). This function is only called by i2c_dw_isr(),
>  which in turn is only called if the device is not in polling mode.
>* The flags set for the AMD Navi GPU devices are:
>  dev->flags |=3D MODEL_AMD_NAVI_GPU | ACCESS_POLLING
>  so these devices are always in polling mode and never use an
>  interrupt so i2c_dw_isr() is never called for them.
>
>If my reasoning is correct, then for the AMD Navi GPU devices,
>dev->msg_write_idx is implicitly initialized to 0 at allocation time
>and its value is never changed after that, so the explicit
>initialization to 0 which has been added in amd_i2c_dw_xfer_quirk() is
>a no-op.
>
>What do you think? Am I missing something?

Hi Jean,

You are correct.

This is a preventive fix to have a common init path for the common data str=
ucture.

The concern being that if the code is updated to use this idx, without this=
 additional init,
the code will behave unexpectedly.

I am not terribly familiar with the CVE process, but from my understanding,=
 I don't think
that this is an issue that warrants one.

Does that help?

Mike

>Thanks,
>--
>Jean Delvare
>SUSE L3 Support

