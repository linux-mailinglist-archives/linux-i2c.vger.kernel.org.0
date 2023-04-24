Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE8F6EC6BB
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 09:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbjDXHDw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 03:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjDXHDi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 03:03:38 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7064F30E2;
        Mon, 24 Apr 2023 00:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682319816; x=1713855816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Qh/mGcO5arvIrbknB3KqoLqa6GFPJoOeetSNDovtO4=;
  b=AJM25UPD1296UsaXpopTqmutqOGKDEa8ybOIv09W/2T6xVf8lDDJl65T
   LTpoPVNxM2H4l8wKHddYfSMyjqByBZeG6ZtZ21yoxDfOppHVR6oIoPVou
   ngqmgVzEdqKS8GMB8A9VyFiH0tfh8bf3D0MwLZ8sNMBnxjgIDs7uazcIU
   cxwqY4l+K5ICfQS6zas8wd6N3/4z8TawrhDQSXqZyQADENnJZyqHUnn35
   NSVNGPzgj9yCwfSD3Q2kMrz/qlrcDcUFyWB0L7QqejfM2EwyDsdgvTRqZ
   vCa1CuftZ18z71f+IHO7iQfGxOngaKVKCyHyh1dUbjbLIq/LwUZ1n//bZ
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,222,1677538800"; 
   d="scan'208";a="30504448"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Apr 2023 09:03:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 24 Apr 2023 09:03:34 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 24 Apr 2023 09:03:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1682319814; x=1713855814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Qh/mGcO5arvIrbknB3KqoLqa6GFPJoOeetSNDovtO4=;
  b=ObykGGSrwtABRMz+nng6UIhT5pUgFexwwIU5Ahb26GZy3KZ3o4kNsNCn
   uBxpKEs/9/gGk5Z6CN1Zcxr0OVr+P5UBMjXHeCWY1EjeSfHf9pFQyCPUS
   ly9tQGdt/nzfMAl12AsBgV9RMwyq3zTHMgCW4k7fsjSypn2t/WUrBc74g
   rKG6nihfobh1MIyuc4e2mIOAPRxA0E4VoJePhFxPBDS1iUomkm59s68lp
   m1yTw0Te8Nj+OBlcwdoJs6tbp8PQWoHXwusyjgk2yFdAZlsmM9k16cyhn
   EjAWTyOd68nJW5fEMXei7Jx53kCNSX4LLJE/W5HrD+OhVYa3USwh3aEKn
   w==;
X-IronPort-AV: E=Sophos;i="5.99,222,1677538800"; 
   d="scan'208";a="30504447"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Apr 2023 09:03:34 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 170A8280056;
        Mon, 24 Apr 2023 09:03:34 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: lpi2c: cache peripheral clock rate
Date:   Mon, 24 Apr 2023 09:03:34 +0200
Message-ID: <4797405.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230421-kinfolk-glancing-e185fd9c47b4-mkl@pengutronix.de>
References: <20230310130815.562418-1-alexander.sverdlin@siemens.com> <9272339.EvYhyI6sBW@steina-w> <20230421-kinfolk-glancing-e185fd9c47b4-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marc,

Am Freitag, 21. April 2023, 15:59:52 CEST schrieb Marc Kleine-Budde:
> * PGP Signed by an unknown key
>=20
> On 21.04.2023 15:48:59, Alexander Stein wrote:
> [...]
>=20
> > Now lpi2c_runtime_resume will call into clk_prepare() which also calls
> > clk_prepare_lock() (identical to clk_get_rate).
>=20
> IIRC this is a general problem^w limitation of the clock framework,
> clock providers cannot use clocks themselves in certain callback, e.g.
> set_rate.

Well, that's essentially impossible when this clock provider is attached vi=
a=20
i2c. i2c transfers potentially need to change or prepare clocks.

One problem is that during clock registration (__clk_core_init) in the call=
 to=20
clk_ops.recalc_rate an i2c transfer is issued (via regmap). This is the=20
inverse lock order to a regular transfer runtime resuming the i2c master an=
d=20
preparing the clocks.

While looking at this, is_prepared is also affected by this. It's reading a=
=20
register, thus issuing a i2c transfer. But this function can also be called=
=20
from within clk_unprepare_unused_subtree, which holds clk_prepare_lock as=20
well.

This might be avoided by using regcache, but I'm not really sure this catch=
es=20
every case.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


