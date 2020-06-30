Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E3920F907
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 18:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389792AbgF3QFH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jun 2020 12:05:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:40198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732334AbgF3QFH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jun 2020 12:05:07 -0400
Received: from localhost (p54b336a9.dip0.t-ipconnect.de [84.179.54.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 372A02074F;
        Tue, 30 Jun 2020 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593533107;
        bh=DVQ7kn2/Wku/b7CfuzAtJBp0Fob1ESFgaHZeJXVEbJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d/Za/jf+99U8fE9hJ+CG+bJjyPZUgqY+Da2VK5aWdBQBuU7E8QIADUfnnqiAQwc/2
         NOHbZBlc3hKxBnK5WYH+qPjeDYA3gg4Ato6os5prHvw5+ZXMMhEm5WgE+r87jSPnJs
         2b63ibRL+yPYmVOaLS37uJK1yYKjR6FrkLrIUpbY=
Date:   Tue, 30 Jun 2020 18:05:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2 0/4] stm32-f7: Addition of SMBus Alert / Host-notify
 features
Message-ID: <20200630160500.GA2394@kunai>
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 25, 2020 at 09:39:25AM +0200, Alain Volmat wrote:
> This serie adds SMBus Alert and SMBus Host-Notify features for the i2c-stm32f7.

If it is not too much work for you, I think it makes sense to split the
series into two, i.e. HostNotify and SMBusAlert parts.


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl77YqcACgkQFA3kzBSg
KbZ+qg//cgwscro7RoDB8rFd2lb0GlBRleq8H3qAVXJxZnOM7kKr7Y3gJ7cVOjCc
Ly2zLQOGeTpMZ3v5D94DI4DcxGXyH0BMKcXP7fw5llG24dM2Kgq/WFE7N9fRl4Fo
dLbxUjuBU1XXTc+o8K3CD7uEkFn1alBNGf1xeHinUvFOoThmGxh3F/B0KeKBH9OL
ydIFuwgBZJAbSrcA3TLLjqTF1THSFzrLI7eG7hyE3VqZs6xF8onzTG0OEIoD5Y+k
0N2cWxP8bUKUb4s50PDGsqeHkXJ/mmt+loWwh6O8955RXGSvxS+dQI6B6XB7bLTg
F2CEu7EvefCpKu5fjTfLCpMy0/ma7dAbcrvStqq3hMCHIjBWYq7A+qkhjrCCTzhX
6TE8Kr81w0hIoahxe5pE4F9BLG+KKVo6hiJI/oJT0ylRLQsXmrpBgNjzJooxzOYw
1T7qPD+3O+iUMQYPsre+JGY84cfDtjpcIptaJE/BHhi5U8Us1AQ5x3Cbw+4ZmIbS
2LW+Mje6F1licPoZoSp9o/HfwBt3TL+4aUEpyEwIWzchbhCWlbW5D7eTRtTOSr/C
BVs0mix8LliB6N7fQozyCmGI8+80Zqb4ZMSfAJ7AY5HWNRZUK1Q7XTm+uy7bP2oc
85NQkLaTTZ+RhuXmeitFb4tR31A9f9rxZRhXy7fTwV/Iu6MGkNE=
=OZyO
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
