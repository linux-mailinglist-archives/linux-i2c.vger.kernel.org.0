Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4530C5907EC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 23:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235677AbiHKVOD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 17:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiHKVOC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 17:14:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50AD99B57;
        Thu, 11 Aug 2022 14:14:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7219DB82292;
        Thu, 11 Aug 2022 21:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52274C433D6;
        Thu, 11 Aug 2022 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660252439;
        bh=UEGFuFwbf7DEIfkoWKKvlIAB1teWJmIDIeNakWiee3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dJjPDtiRW21vLIJAnCb8MrA7nuiYS7pVsXO1wHR4sMMPt15eQax/fRzvsdnVv4cmB
         Su1honK3uqVEpA2aL+PyW8dDjgAwLOA0BghaDm7WKCg1f1frWz2FzPZ80/KvzyfeLP
         1oLPfXTRzQbv1YwAOXEuBT/G8bNqMYVaShVtzCvGcDBlC/CQXVkSFeQHNpBo+/Y0ET
         KxY6+pWrN6MVbHIEn9RMNXP94oFr22NDXG5m8VZr38WnXczDGfXDqy8Dr2rTxFJTl5
         CS+xyAJ6UrMKet9bnluQ77mOLN3CksMOLo4XjWM5GM1YBUOSD1uv7Y2bxSzGdvNv+9
         FIYsyM4CVUQew==
Date:   Thu, 11 Aug 2022 23:13:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     luca.ceresoli@bootlin.com
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] docs: i2c: i2c-sysfs: improve wording
Message-ID: <YvVxE9jLNJZ0NWtd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, luca.ceresoli@bootlin.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
 <20220808141708.1021103-9-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dcuh0Jc144kXWsQ6"
Content-Disposition: inline
In-Reply-To: <20220808141708.1021103-9-luca.ceresoli@bootlin.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dcuh0Jc144kXWsQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -First, let us define a couple of terminologies to avoid confusions in the later
> -sections.
> +First, let us define some terms to avoid confusions in the later sections.

Does 'confusion' have a plural? I think singular is better here.

Rest looks good.


--dcuh0Jc144kXWsQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL1cRMACgkQFA3kzBSg
Kbasjg//a9VmQM1gnBCacQH0b2PslGxIXoQ415Ih9+THfVTYnHmAhoKAz8FvAuTd
8vgGy8lNKPWVuoa2xzl26kW6F8Ifv4SP3zjwvvKjNsTnHj4gyKaddaOvoTZK49wY
2QtUViYz00bCYRsQQRB5hq15klHoig3vOyfuaamdRQIxXdozwXTxZw5YV+EYM0ye
MSj1jcEDb50+byl9LQGERuIACVneKOhCQokzxsfC3frJZI+Oh3Wzjymr+xvQNal5
ysZqC2tIR7YsEDpi5Mgc0EtnYoVqruMfF4UTGKFD2FMbK+l2T/Y7EI7yJydIksNs
600Uy9ZoknQUnCqgv79lI+jyDhv3RQ+UpmMFGlift9JOW3Fp0nhwS+JcPcoiP4gv
QQXoZsoDkggCJ+avo3+oOJHl7eHcYdOpAOVWLBv8XHGkU7O06b8LRFb90C0mG0Zh
bl27kkIP8Pm5wcwLa/7EEDst2NnCwxmMH/f1UYdfZaYeOheudpnszRNzNP6uUl3O
yGW9F2KoSVo6YXunzjHDvjhXbhlSPAmu36CrKZzufxEV2MOMx3RHIaiGB7K9ZWPc
Cweqpye4o2CsiX1GW0rReJkN5RFfXR8qrbp0aeWLGDJxNxMqFSk6/zSUmkPa4t0T
1mPC4DnMRdwsoV5MXupf9tPkDOGMvzPZVIQeqB1Rg85XxX2wLwk=
=pqOP
-----END PGP SIGNATURE-----

--dcuh0Jc144kXWsQ6--
