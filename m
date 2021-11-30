Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075CA462F8F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 10:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240171AbhK3Ja7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 04:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbhK3Ja6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 04:30:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02534C061574;
        Tue, 30 Nov 2021 01:27:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 902FBB817CB;
        Tue, 30 Nov 2021 09:27:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4E9C53FC7;
        Tue, 30 Nov 2021 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638264457;
        bh=W8CE3cPbhNtMoO8hl1s/FLPTFSn34F1Nw7lE7AMcsIA=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=UoONgVPEsC9vpaoMTTISZa3IDl6GMwNM8x7l0arA0JqyJ0TC8R3RpjC//3iwFGKCu
         W3d6CnF5tpunDQJHWfgXivE+QiypHBDB1uginz84WtBF5tbmvvCpZ/5PEbPa7MZ3qS
         uoaJM0MCF1vpP5f1P4XSSCbWh0x1fXYYRgNBTGxYD3vWPrg1YhvZ9Jir+rs54tBdSc
         t4CpTf+cP5l7ONiAvKW3nQc+ck99H+7UI9ogVympssY6jzvtS/n8t/KPL8g0YKJJLA
         NY28mvsbKoJN6nNBoyOt76r1H/HSyUqtfL4ocJExR5Nl+ENzr5qz2ANR0ifFC6DZ+9
         oe0ENo6zoXU9g==
Date:   Tue, 30 Nov 2021 10:27:30 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 2/4] i2c: stm32f7: recover the bus on access timeout
Message-ID: <YaXugmLdXkaM1pk4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
 <YaTE0f9ciy5JRZ3Q@kunai>
 <20211129123302.GB486850@gnbcxd0016.gnb.st.com>
 <YaTNDq7rEyQIopim@kunai>
 <20211130085618.GA668426@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o1/kEuTPtFxza3Gs"
Content-Disposition: inline
In-Reply-To: <20211130085618.GA668426@gnbcxd0016.gnb.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o1/kEuTPtFxza3Gs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I agree with you on the fact to decouple this with the 9 pulses bus
> recovery and first apply this one first.

Good. I noticed something in your driver on the way. Will send an RFC in
some minutes.


--o1/kEuTPtFxza3Gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7n8ACgkQFA3kzBSg
KbbePA/+NAO90IQcrq/MNtcd5t13UslCVlXXNauFGvI2Ur7HFZ1pf3ZzG22DQP9W
l36Ta8LtNt+dCrRj+h051bUzS2FJA4Lrt/hQ18sDxKTdysoulGZUXNcn9VyI+xfF
FNl5EM/YWIPaSQMVm6Ks9vm70v+r2jnxCpIBb6p7qRtAlVSjCgKCvmaX5bG410mW
Pcl46jss+fySA9j8IyYn/3zVZNharjsH4jlk8yQotVlkRsVTQwviMk48g1XqcqYc
ha+9FkrklpdYuG6yQ1r2OTiQmZtIgO1OBSB0+3ChqhNyrXtM4vkUehsEUiu0UMyN
VaPhhSxnDItRPdEwGmU7g4NxA5p5hk+5ejM+26lYNTLqhO63mnflq1b/GI/wgKEB
glr83SyJnSghjAcIl2EprtkNiU7SEWPm8wEmLmwCs4PZ/DjVy8q0hBu6Zt+CWFVP
r+VDE9wIxcXYsy58adm/E1oFRlKxSylNhwFj3JJ9lEPSOfmUgcWQeqYgUWr5fBw4
ofVJAMNqS/rwFHI1xB39u4KZ1UmUvXcxfeH0SHayZwWyBIACKO5/X+M1jMlFlOd6
EgtWgE9V4buQrVmusLspa3jcs3UHetCo0pfAAKxsPMja8I5PSKLw55F6LYpfk8Ja
bmyJEKBGR18blkSGZ93VQvC/dapJ/tyvL1aWdJxT4g9GnbzYVhs=
=x/KB
-----END PGP SIGNATURE-----

--o1/kEuTPtFxza3Gs--
