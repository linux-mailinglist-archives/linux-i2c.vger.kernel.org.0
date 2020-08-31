Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6B2257A4E
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 15:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHaNZ0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 09:25:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:53188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgHaNZZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 09:25:25 -0400
Received: from localhost (p5486cebe.dip0.t-ipconnect.de [84.134.206.190])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F3B7204FD;
        Mon, 31 Aug 2020 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598880325;
        bh=mtPe5tA/nslXjmp49yCFWMwgOILvTMGTcI1/yLrsXgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZVAUJ1KTD0zH8KJZRPa1UwYWiUy0s1/GsUqmabX/6dlRG1CIdraADGQ4GoFEV6gaI
         Qj6Wpjd7Vi0QyUcOjuB2kkCho3QOrwtgChfcZm1jvWK+SjCjRfrGtk7uwrLWL4tWYd
         BRpTRsfn7TsNHLL/ItKLqScCHIM+/U9jdXV5MkM0=
Date:   Mon, 31 Aug 2020 15:25:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] decode-vaio: Scan more i2c buses
Message-ID: <20200831132522.GD1070@ninjato>
References: <20200831100256.077ce253@endymion>
 <20200831100919.519f66a6@endymion>
 <20200831094855.GA1070@ninjato>
 <20200831150405.1a2df039@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ylS2wUBXLOxYXZFQ"
Content-Disposition: inline
In-Reply-To: <20200831150405.1a2df039@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ylS2wUBXLOxYXZFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So until someone comes to me with a recent VAIO laptop that needs this,
> I am reluctant to invest more time into this.

Fully agreed!


--ylS2wUBXLOxYXZFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9M+j4ACgkQFA3kzBSg
KbY35A/9FsDDDvr/PgPYgo61EcJlHVTYetNIpSfXxxVbSDtrbffJM4BdBA4JZBuX
IIzkMt0K5YdQa5sOtKy1YMugKeDRB+TAkvUZWaj9F1d8DRod5FF+tWfT/F4totV4
6khxVBKTJnuSBa9lSZ4y6lKfa+8lOFj01w5KUn1VPE9ZF1jmmGUyLhQQKHC6qJ82
pxF3nPfL8fTlFoRpSHerKGWMHlo/TVjPwkVUbh7edcDbnFfQg8wKpihmRDRKKTcI
GdCukZ8WNqzfeCdoReSMTvTvrf6cGtB2hpFB5cLN+tkWjtLagTykPiAR88gLOp1+
jeML9xAjurQ7TIx4cM9PwjxFhPYoIrboFMCmKIjPkMEGsmna9k4eSCPsvlXpGu3l
s+BrwlX3oio3fYsyFhEC460K0R5Ryyn/vPqviH5Tg+hIQKxMoVkOwZ8i7iB8MYv7
H4+Q/mLkcGpsxBfliQ9NjRU/jeN1BtoG3TgkICOhniCNDf8znnl6EdGlguX7KJMa
zeptZtUo/HUTw/7iC0Ghpnld/csgd+HU2+V3ffughMiZQhesZCL4lLiVTIxHF0XE
5bwXrOQBc/beSRjmuF/TK950cy6huV7zNu33kGpQ2RKMDfl69xtFZkDgtKD3zAns
bLO4D4gO2bdwdePjoECxpqcrNktK6pL95tMcQMqyygStHJPWVLs=
=4SpS
-----END PGP SIGNATURE-----

--ylS2wUBXLOxYXZFQ--
