Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93B5485AAC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 22:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244540AbiAEVcb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 16:32:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244508AbiAEVbu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jan 2022 16:31:50 -0500
X-Greylist: delayed 320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Jan 2022 13:31:39 PST
Received: from forward104p.mail.yandex.net (forward104p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD7AC06118A
        for <linux-i2c@vger.kernel.org>; Wed,  5 Jan 2022 13:31:39 -0800 (PST)
Received: from myt6-a7b93d14a87c.qloud-c.yandex.net (myt6-a7b93d14a87c.qloud-c.yandex.net [IPv6:2a02:6b8:c12:2492:0:640:a7b9:3d14])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id 0FF723C1E677;
        Thu,  6 Jan 2022 00:26:17 +0300 (MSK)
Received: from myt5-cceafa914410.qloud-c.yandex.net (myt5-cceafa914410.qloud-c.yandex.net [2a02:6b8:c12:3b23:0:640:ccea:fa91])
        by myt6-a7b93d14a87c.qloud-c.yandex.net (mxback/Yandex) with ESMTP id oRrWpH315b-QGeqQIOW;
        Thu, 06 Jan 2022 00:26:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1641417977;
        bh=cq4tsU5pDnLDeBZpZ8/vm7TCIw9KkhUDRSOhwBZM/O8=;
        h=Date:To:From:Subject:Message-ID;
        b=Yq+bLphZeaE8uibtITZUIbPvYP3mvxUJehdEml+I43b3B9yJQyEQhYaKY+1Efgaao
         MUlyQ5qFyIc7XRkMQ9DpJrGDGbsDMszPt9LP9T/PR4SxBK79Sg62h5wNr8galZZqCh
         XzOtcIdyl9iz9j9qBXKqubJG0xGWyqO4QJIkgWDU=
Authentication-Results: myt6-a7b93d14a87c.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
Received: by myt5-cceafa914410.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id L5adxC5tU1-QFPqNdND;
        Thu, 06 Jan 2022 00:26:15 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <7143a7147978f4104171072d9f5225d2ce355ec1.camel@yandex.ru>
Subject: Bug: amdgpu stutter and spam `Fence fallback timer expired` after
 suspend
From:   Konstantin Kharlamov <hi-angel@yandex.ru>
To:     linux-i2c@vger.kernel.org, wsa@kernel.org,
        bibby.hsieh@mediatek.com, amd-gfx@lists.freedesktop.org
Date:   Thu, 06 Jan 2022 00:26:15 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello! Just a heads up to this report https://gitlab.freedesktop.org/drm/amd/-/issues/1850

Basically, after waking up on suspend there're freezes in apps using amdgpu, and there's a spam in syslog `Fence fallback timer expired on ring …`.

I bisected that to a commit 

	5a7b95fb993ec399c8a685552aa6a8fc995c40bd i2c: core: support bus regulator controlling in adapter

Since the commit is not in AMDGPU, I send this email to linux-i2c. The commit author CCed as well.

Should I send a revert, or is there a way to fix this?
