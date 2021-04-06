Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D89E355C6E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 21:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244991AbhDFTlX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 15:41:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244955AbhDFTlN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 15:41:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60E6A613D0;
        Tue,  6 Apr 2021 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617738064;
        bh=oM780R+keOpM3whWlg0CbJi5gi+Egl2EZbNGxHQfmTo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lI4kxA+xw+j2eL6thHPsL3XgKJ+xlQvvCc6ZG+anZVRhCydoT2Mu2FjLam8NVlXXE
         BS2+N8jfWwtXhQ9B6zTvqR1XGFBM4KLE4kXtsjlIFXk96/R7VItxUt7LhoF5+Tkj6U
         mr1aEZW5O0MKcqR1Eg51dJUPeWmZ9vWs53Xde5uvm+06s/zATHUPS3k62PXx2dNnju
         IO4U8mHZ8/OCyEeVc1HqL5YYArYYFTcYsKD189/LjJZUFL/VfaCsVlgerbCPTEW3W/
         jdopZhHS9DIJmiFz0DOfVANC9vgbKqhni9QMdw/siRBI1IxnLQ+vHTor2c6SS+OZR7
         qlnUdl33VwUtg==
Date:   Tue, 6 Apr 2021 21:40:59 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/12] platform/x86: intel_cht_int33fe_microb: Constify
 the software node
Message-ID: <20210406194059.GE3122@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329105047.51033-1-heikki.krogerus@linux.intel.com>
 <20210329105047.51033-7-heikki.krogerus@linux.intel.com>
 <6d4d44d5-c213-1052-16a6-833a7f01a0ee@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M/SuVGWktc5uNpra"
Content-Disposition: inline
In-Reply-To: <6d4d44d5-c213-1052-16a6-833a7f01a0ee@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M/SuVGWktc5uNpra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> What is the plan for merging this patch / this series ?

I'll take the series via I2C.


--M/SuVGWktc5uNpra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsuUsACgkQFA3kzBSg
KbY95w/9EB1EeLf9ta3ZBHX/ZCNRdXMstnTB06qMv9vPEqOVnwjfsFH7vX6RGrsq
JmrJp3E/KDpl14whCSXLIS1y5E0MQJxsJjw9CkG0AbuWq0mnuBQ0t5z+Hz4wIXy9
TCDlN1m2VwxZ7FV7ocCylgxCqesjIIPlRrcWb4cen6cq17tkA4/H1hvIZiFdg+cn
VIuZg/7Fp25eMwkeVmhfS2tUlJmXjbpR5kC1yAIo0/Ke+P3ZRI2115kOV6QWWYmm
XQNwVRS8RaTFq23aZyOWQTkRl3nlpMoc5xNajkc0pnszgvsJ09Cc045m+X/Z7aBf
9JyMUhv+l33v1LdjHjlDSC0e4tE7tEWgXSOP45ddn1BoU/ZVLH+0QHLnkEgxbEdz
8FUX9xvVceyYX0Wv1aNjPHC3VUW1IRBPIydQm5eJ3MewjxDhi7H2xUD4MP7zC0MJ
Gv7m8RGe6tHonkYJEmhCci7FxVaAGPGIQJRAUoNGIiCh54MoW9YXpCxg7zXj14ie
zRPY7mcJ1gVbudbzC9JimGhBvHk6Kp/pLvSjLQr+4Em5o4LKBjpcb64NvfwaThDe
kUmOEsPpOvSCGtfyJfgU3bRVSRxfeo4SeSnFTGDCh1M0ThI/1lym3kyHyEsNsFIE
HMYyasDhz4JnQmKOoQUHnIVoFNekW++PWLcdvi9RhKt0qadyXvY=
=mhu1
-----END PGP SIGNATURE-----

--M/SuVGWktc5uNpra--
