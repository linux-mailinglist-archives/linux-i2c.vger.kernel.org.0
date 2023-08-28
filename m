Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7037878B7E0
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 21:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjH1TKj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 15:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbjH1TKg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 15:10:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A331E10E;
        Mon, 28 Aug 2023 12:10:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A58E641F7;
        Mon, 28 Aug 2023 19:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF8FC433C7;
        Mon, 28 Aug 2023 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693249832;
        bh=siOrAmr3b6xekbBh1aBJPqZFhasXx+4rwr3ScAiH6uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Po4Qih/b6u4Ws+VtFrlopwGDuId0ciNWLx5lNO5xyw8tC0UUAdHE43wkOVSKAfdKF
         g2Voa17DEVzWLoh29AslSGO1g7s5nRtB7jP8ARV7DAlgdgdF1mJRMiZhhYveZCgypC
         rp3KaISNe0e9F3BHuAY9bJdzFKX9jBY5ZPcTBZpLMaVLwniA2HT9OVQW4u3/Uhl2tD
         pfZZ981tu0yBall5oYu1xdjHUNqv9fVRa8S6PIKfii58XtROW/5Bx18XaNT5x3w5bg
         U9DU8y4ifJxXgZddHEPBb6X88wejihl7E8bt3K73cIYXGRXziwBhKT3sgivVfy4bpz
         eTDfJRZ9ZuEdw==
Date:   Mon, 28 Aug 2023 21:10:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     roman.bacik@broadcom.com
Cc:     andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: iproc: handle invalid slave state
Message-ID: <ZOzxJSeHhB1vrXff@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, roman.bacik@broadcom.com,
        andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230824212351.24346-1-roman.bacik@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hlGpReK/VHn0q2T3"
Content-Disposition: inline
In-Reply-To: <20230824212351.24346-1-roman.bacik@broadcom.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hlGpReK/VHn0q2T3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 02:23:51PM -0700, roman.bacik@broadcom.com wrote:
> From: Roman Bacik <roman.bacik@broadcom.com>
>=20
> Add the code to handle an invalid state when both bits S_RX_EVENT
> (indicating a transaction) and S_START_BUSY (indicating the end
> of transaction - transition of START_BUSY from 1 to 0) are set in
> the interrupt status register during a slave read.
>=20
> Signed-off-by: Roman Bacik <roman.bacik@broadcom.com>
> Fixes: 1ca1b4516088 ("i2c: iproc: handle Master aborted error")

Applied to for-next, thanks!


--hlGpReK/VHn0q2T3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTs8SAACgkQFA3kzBSg
Kbax5Q/+IutYcVwGbCdtcncRw8nkNEV42Tk90UzU0aXYmU/G7tec2AmJBSRKIRYV
je6GSZ4kZCXQLWAFGBuovBvPtzYjmN2lVuSGC4eHZQ3V2tOHPuqInpB1q1J4HpVm
G3mUnX2bywR8663BF5IAOkurvOCdeAKcfuwNnAPWl/W0oweaCku8pg3htYR1hc3K
YbFNhG/IakwISZLimyFQp+z4YLg5OcGCV7ckWAH9dN5mDYOSGaijj4TCF1sLHTKp
2aO6OUjxoS/TdZcSqAEOXe27Yu8NTEbbFopfqMbxPdyEv4cwhfF6JljlJZg3DtAw
vlS8Y/7BAuzybwZlPoy1kfSN4mWvga/gECOjy9RMgHvndL8ZlX693vtnEzTmkXkf
jclp2cJ+CxI8VzDUYai9GHZfc+Lwp5XfMDtYdQJoHf887MBTdryMe3LI/Pwk8Wq1
ZWlApOx7Ikr++XJ7zt73w1n6TXvR5ZTXRnBxfwxjpRja/1MUwHOvLHgJ3awfv7+4
IjEx6FKN1/3D9q3Cy6zeloF7pwihFEupiqOdRCwesPahQIzypz88/niJStDKAxXh
Ejt8P0Wd7yIld8IISL5tByWegAPLI+aRqW8KGpj7IEFtcvlMMehM5Cr5Z3cyP1jQ
2PzxDcYxVNQ7POxnehsuLlZvEucy0EZz2sOYJIeUb9L3G9UftLo=
=F767
-----END PGP SIGNATURE-----

--hlGpReK/VHn0q2T3--
