Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2A1271EB2
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgIUJP1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:15:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:51982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgIUJP1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:15:27 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 152BF214F1;
        Mon, 21 Sep 2020 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600679726;
        bh=gpUEgGaj7qwnPbyCn8E9GntJ2kpJTop0zsxc8eNtV1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GE6B+g9UcMki9RMBhzEGxWrskYugBNl76ui1W+edeiFomRs+aac9ds0PEwghtwwSF
         spfJc1EK1w76a/F4Qx1Bfxu71xiQwx/Oexi/Ollw5q+ZDMDnOR2XyHS/IQFOQopeRe
         YJntyWh7BKY4Y9WgYMObgENUDhbridSqxx7dmIWQ=
Date:   Mon, 21 Sep 2020 11:15:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wang Qing <wangqing@vivo.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: Use kobj_to_dev() API
Message-ID: <20200921091523.GF1840@ninjato>
References: <1600312126-24048-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/aVve/J9H4Wl5yVO"
Content-Disposition: inline
In-Reply-To: <1600312126-24048-1-git-send-email-wangqing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/aVve/J9H4Wl5yVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 11:08:44AM +0800, Wang Qing wrote:
> Use kobj_to_dev() instead of container_of()

Correct. But same patch was already sent earlier:

http://patchwork.ozlabs.org/project/linux-i2c/patch/1600133898-35883-1-git-send-email-tiantao6@hisilicon.com/

Still thanks!


--/aVve/J9H4Wl5yVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9obysACgkQFA3kzBSg
KbaSohAAgDry1ostr3KHmKSkab5eTNueURh8/ziotQYuXakt0ogDYx5KWpsPdIBh
zEobJdns03GS8QPgRK+8liIi0HDQqLnO+ix9RGjsvSfg2O6rmzBAP2hhJNsKd9ix
UhUg8URKdo0Mir0AlY4jxbNTT/tIxmefZBS8ktPLDqUuq/sg1K1Z2PQdp0kpWl6T
rd9aDDhYZVYADSos0oTGsvAlhFtnZrKnNYnufdkJ+0vQXb8qSgq4/ui1R5iaUY81
A1QcQoQuTf7vZvKy89r0kp9J1Sq90uvk7nuatyhqk8ze8tQFXvzA2wmI6l7b9Bng
Ngrb3rkBKdwXY1z8PSTRnFodPxQeAGtZ00ndq8Ez+r4k/oZilY7qml8LjgBAk9q2
mSUs6LhN5VGPNyphULmoJknG3bl4YliiSnvIXdvjYInCRMjqj4Mgmk4TOXUoxHNL
kJQ+3YI423ONOuhZIW8zMBZsSq4ZoxSISGZY+FSUp4Hvku67iZZI+xJutg2tD+tP
PqXOe+baAA+qEyoNxDUsWIqjldBDTbqpeSEgtvwnCg6QGdrzzNNP1AUfmJkX4kF/
N+GWOkznYnmz1hTRlw9eKJrqVRyoon3mMM2rmV26WSAiCX+4W6a54fv/dNXh/bRX
wev45AWJ1eREHqhkRuc/Bmk4NM0E7xechFf92gLxzqw91Cc/CPM=
=4xiY
-----END PGP SIGNATURE-----

--/aVve/J9H4Wl5yVO--
