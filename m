Return-Path: <linux-i2c+bounces-6397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4389716B3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787E01C2309A
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 11:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F07F1B5ED0;
	Mon,  9 Sep 2024 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ItBs81DN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B500B38DD4;
	Mon,  9 Sep 2024 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881009; cv=none; b=jq2AsCCMwzco0S/QyMRSYxJa0HM16sZgxQqaqdEJlixusYnRqR/yOyPJMwrmgJm3FyNERpq2FCx9HMqQ8pEpgAglavZB2eq5J32TxCW04h9YATl/YSydraeJ6bwDcIoz/gkgsV05rSUKxSxw89HeaOvmuOj8oylQ0JNUJ2Xgaqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881009; c=relaxed/simple;
	bh=zLM7+cMuFs6iukBYw5n+MPt84i4IDbR/JlHH34jlnQU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=le3PCYPDurAyq9bdAuhvLZoxc8CIVHYwsRmNEQ/+5w4pL2SDjzIHyEss3PUTSYlvJF4pQ4F5VysyqBrFc6eFOwjSf7vTxjInppHG0BUW3FHBy03adzhW1st2PyBEJywvHxd2ZnJG5M+/mdokYnYdLUEzMDV9iTX947oE8S03Gi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ItBs81DN; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725881007; x=1757417007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLM7+cMuFs6iukBYw5n+MPt84i4IDbR/JlHH34jlnQU=;
  b=ItBs81DN06x40gbP3RQuO1/nJTXRhc2OrgPr4Meo5d/qHJr9+Cbo06be
   pDgr9b1CrnT3d3HeGT1WqFiC1RTH1fqsRMi8u2JL0fbNmkPpigrVDBX8S
   CMdfMZ2tgxGo+mPk0WgSBOHHXvwrs2Xg6YTzksHiiRxByQR2ZIi92zVDh
   L8BpW/mL4867y+xFO7barfjs/y7AzpKD2KjD3NA4+EH69T9s8wBxFJCIB
   zjwFidVi9+VtW2kzkjRlD7WUGcFxZS9xsW5UpKrDXQXCxdcTA55MEsyPm
   pN0lRGUqHa112lky1an97ppUA5RaZ9BVMiNh06QvBSji54rpa1uNJYc6s
   A==;
X-CSE-ConnectionGUID: ROYUbOWeSBCl9l3tx7dRMQ==
X-CSE-MsgGUID: nBNhi4ddSa20nViLHtbeSQ==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="198945806"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 04:23:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 04:22:56 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 04:22:54 -0700
Date: Mon, 9 Sep 2024 12:22:22 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <20240909-jugular-cucumber-b7d9bc614f74@wendy>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>
 <o4bks5pxn5olnvobln3z2axi6jx57vz5pq2kazyzxemptbp6fb@p7qsppr7ks55>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxjVq46O5l/YZo1k"
Content-Disposition: inline
In-Reply-To: <o4bks5pxn5olnvobln3z2axi6jx57vz5pq2kazyzxemptbp6fb@p7qsppr7ks55>

--uxjVq46O5l/YZo1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 10:46:02PM +0200, Andi Shyti wrote:
> Hi Heikki,
>=20
> On Tue, Sep 03, 2024 at 05:25:06PM GMT, Heikki Krogerus wrote:
> > There are quite a few drivers and options for the DesignWare
> > I2C adapter in the Kconfig. Grouping all of them under the
> > I2C_DESIGNWARE_CORE. That makes the menuconfig a bit more
> > easier to understand.
> >=20
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>=20
> Thanks for your patch, I can take this only after the other
> patches have been taken in.

I assume then that you're expecting the prereqs to go through the
various arch trees? Is this not trivial enough that you could chuck it
on a dedicated branch in your tree and if, for some reason, there's a
non-trivial conflict the affected could pull it in?

--uxjVq46O5l/YZo1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7abgAKCRB4tDGHoIJi
0kbuAP9R+mwXyTEYXLHhGDAg1NcN7IBZ+2d3j9RPRVsfNy14jAD/fW8juYkVOF3i
TX3M1RBw8CRw8Ws7BOScozP9bKauNAk=
=XHNm
-----END PGP SIGNATURE-----

--uxjVq46O5l/YZo1k--

