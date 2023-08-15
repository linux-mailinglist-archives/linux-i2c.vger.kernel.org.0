Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8165277D3D2
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 22:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240057AbjHOUBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 16:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240152AbjHOUBE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 16:01:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB4883;
        Tue, 15 Aug 2023 13:01:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8C5065F37;
        Tue, 15 Aug 2023 20:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9524AC433C7;
        Tue, 15 Aug 2023 20:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692129663;
        bh=EvZs3//r+5RX7/NTYdrqg9AZrjkjRWoh42oY8jUURpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hLFxBTyfGv+cv3LAjiUVd/ceDyr3FGOOd5FZYJq3ZCZ9s3lHDhyMffM2pAVCDJuL9
         jv65lKr46zV1ZWCOlZ1uFLoV1Houz3nAEDAec0HKgA3dz7W4hYD62ThfF5TkqH5jQM
         4IvX11YnlpPsQbv9ahey9MFs7pEkQ305Y5GMYHuoiNgvJRIfc/wAVF4uPFytmhub0s
         X8s5+lWSuosZRzK2JRFOS+FKfA+oKhws7iKsfB98bJw9/ycxt8yVzmNs7hYczaXqXG
         Q6HOF88QDzICvaQfc99CrC9yUJDffOrXl0SEDQOm97s5t+XtJuIBAj4OG66IEunLw6
         2v8IQ7axsh0Tg==
Date:   Tue, 15 Aug 2023 22:00:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Rob Herring <robh@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: add binding for i2c-hotplug-gpio
Message-ID: <ZNvZd2sOK+WMN4XN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Rob Herring <robh@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-2-clamor95@gmail.com>
 <20230811173752.GA3639776-robh@kernel.org>
 <ZNf9vKJHc/FFlkY4@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VNSvbZBwBusE8ygy"
Content-Disposition: inline
In-Reply-To: <ZNf9vKJHc/FFlkY4@qmqm.qmqm.pl>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VNSvbZBwBusE8ygy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Not a driver but a group of devices (possibly discovered dynamically)
> behind a passive gate (like e.g. PCA9517A with EN tied to a connector pin).
> It's not much different to a I2C gate or mux with a single child bus
> (i2c-mux-gpio that has only a single child).

I agree. To prevent the the bus from spikes when connecting /
disconnecting something like PCA9517A should be in place. And this one
can be considered a 1:1 mux. Just with the exception that Linux cannot
control the gate, but can only react to changes to the enable pin.

Can't we have a driver for the PCA9517 which gets interrupts when the
enable pin changes and then adds / removes the child i2c adapter?


--VNSvbZBwBusE8ygy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTb2XIACgkQFA3kzBSg
KbZ0CQ/9HaWnOT59/L9KdKzqxf5OJrVvdhwELVc04Bnuu0DQf3l2oH2msar6ptKP
mLZgg2zD8LDypWOGe34YlKy1UvUcis8bYwpYSg8yOXg6XZWd+iyJkgm5SsutkH2j
Jufawu1SRM06hgPC1UGtnIR17aNra2bRI/N7XgptIvfiWriNx/8klVPmXMfvkcjt
cYHsJ8d6vRls9nOEYXruiTMYJ5TGlj9qaq4Kw3sYg/nGsIoreVkRHjQJfQY7tnkm
vpRaQKL3MPurpBDaW/Ov0KaElminXzumRX0qDqP4qOmPnnCJIZftIAQs5NhU/3xj
15ZGKz9KrWv7f8RDaaC6pO81hUyNOgC6c0/dWC+Nl2CTlmsLoZqohYex0hRx5o4U
DSg8jmF2MAofXISjuTwzjhssS113W790W9vEqncuu0AavfW+sAkJjU05iwvyAGsI
fWNOdKmb1vJ/+nMpXoR0xGIxGqhnZkDO3/oOOEg25ORrYsDWjSO7mflNkcVtTgTL
Rz6nsSFWHad+0JAHbWbdBCFRWX4zQtCQX1yKbp6Hs/sWh95JSlKE3fp3QkBm1TKZ
3Vj7tpc3j7dgVUeTkxwYr6HJvmWInxLSrsEfsDTbBg7h789GL9pycF37VnKB9GuC
rFhFicZnd3A549q/oDygX7yYE8OXhQdUG7xmjN53U0pD7QuVjQ8=
=YOUx
-----END PGP SIGNATURE-----

--VNSvbZBwBusE8ygy--
