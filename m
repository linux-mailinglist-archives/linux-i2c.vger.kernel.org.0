Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A97059A24
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 14:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfF1MMh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 08:12:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58280 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfF1MMh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 08:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Ptxuhcj9Nnd93IGVkYIIiqtv0theLtZeYCYEFYFjzcQ=; b=iJ2Q7DMrmIn6Encrs9rppRJsg
        FeL4mBoGRLfaKCHHXrV206GIZ3P/XJemOOMbKDJ1w3SXWtsq4LYO5EGt6J8qVs2Or4osVQfUxapi/
        zjd+hS2S4uaEf7v6XI6b4710tSuAp66i3CHlRgr2MfjGGDbZW1DEQ9gmDkjZxESSIYJlH8OZ9HlkK
        TFdqcGlGS1dlQlgTpXIwtU/CKPSGpMWA5VBUVqYCF/HlnncDfCbol6UXVluUS3GBn4xs2BOZRRdne
        WnPt1VQf1Pp7XWZUQVTsRumVGa7ZhQipl4HHUoDpeOm5kmiY37Rdd4l5z+9p+ucjFP48Xjx6y80vH
        qSast0vWA==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hgpk3-0005Bd-Cu; Fri, 28 Jun 2019 12:12:35 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hgpk0-0004zI-5t; Fri, 28 Jun 2019 09:12:32 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-leds@vger.kernel.org, kvm@vger.kernel.org,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Paul <sean@poorly.run>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/9] Some doc fixes
Date:   Fri, 28 Jun 2019 09:12:22 -0300
Message-Id: <cover.1561723736.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch series is against linux-next (next-20190627). I doubt those
would apply cleanly against docs next tree.

So, please apply it via the subsystem trees. Otherwise, they could
be pushed by the end of the merge window or for -rc1 via a docs tree.

Most, if not all were I already sent.


Mauro Carvalho Chehab (9):
  hrtimer: Use a bullet for the returns bullet list
  docs: trace: fix a broken label
  docs: signal: fix a kernel-doc markup
  dt: leds-lm36274.txt: fix a broken reference to ti-lmu.txt
  docs: fix some broken references due to txt->rst renames
  docs: virtual: there are two orphan docs there
  docs: gpu: add msm-crash-dump.rst to the index.rst file
  drm: fix a reference for a renamed file: fb/modedb.rst
  platform: x86: get rid of a non-existent document

 Documentation/devicetree/bindings/arm/idle-states.txt   | 2 +-
 Documentation/devicetree/bindings/leds/leds-lm36274.txt | 2 +-
 Documentation/gpu/drivers.rst                           | 1 +
 Documentation/gpu/msm-crash-dump.rst                    | 2 --
 Documentation/trace/kprobetrace.rst                     | 1 +
 Documentation/virtual/kvm/amd-memory-encryption.rst     | 2 ++
 Documentation/virtual/kvm/vcpu-requests.rst             | 2 ++
 drivers/gpu/drm/drm_modes.c                             | 2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h                 | 2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                     | 2 +-
 drivers/platform/x86/Kconfig                            | 3 ---
 kernel/signal.c                                         | 2 +-
 kernel/time/hrtimer.c                                   | 7 ++++---
 13 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.21.0


