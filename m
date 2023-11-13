Return-Path: <linux-i2c+bounces-132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA57EA07A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 16:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5EE4280E0A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC172219FC;
	Mon, 13 Nov 2023 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkUqRK3o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C85219F2
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 15:48:39 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95972D63;
	Mon, 13 Nov 2023 07:48:37 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so58591541fa.1;
        Mon, 13 Nov 2023 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699890515; x=1700495315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXnf0eXrDDD8zHz/bTp9TBZLf7/Ul4A7eXzOYgBnS0o=;
        b=FkUqRK3oFLT9imv+K+Fpe9D6klNt3x433OOxTytajgzzoRZkKreKHzyMmRJUPBOHCq
         lG6eLjoUtAk5OCqKY1hwOHbUuwNXsrQivXQjsF6Wm5SKlTlHOpa7/vEMeDt1eTiXh3ff
         +DZDo7bki2RxnVgMiC7gs3iibz+ygPBwjlDZDXIs4+b6SSGxMXm6s0VMZyTgRgMDPxEU
         8CVcvETHu/jc3P2nwcYJ+U3nANl2HkSVJlPJfpQosJfRwtFw4aZgJeqBs0Q2EmucvhSp
         6WjXqn+gDt8lirz/GsvX6FgDfe/0R2JqBhOToV8QELGR35j/Cak80nlW0ZLj/E1cg7xm
         9Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890515; x=1700495315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXnf0eXrDDD8zHz/bTp9TBZLf7/Ul4A7eXzOYgBnS0o=;
        b=rcfKaghUyNrrQ8dVGDdC9YpKmF0mFXhKlu3IvldV4X4VnK6gorfIK2Z99PF3eLa7ZB
         ShhuWoZmVgI9A04p6rPgS25jXqIPQU/DuebJvgMNDVQHKufx6sinRAxXQA+42j4iZLWW
         nfT0xDVxZ5XzUlwC7JLD4Bkib3NaKeuFdvCPR49rHrT1eIu4gysSyRrfTY36WcWKIomM
         k+KFM9ueJ3oB7/CyBV38MvSnafdpPbFFSIWZHSi6lqUmeWfwli9MtFXQ7kbtCtuCkNwT
         BLWUpCbK3xuMhytMqteegVqTLX1D8V9MNEEGfKN3sdRmvsndd6FZpcwlEywaLVdZgdO2
         8qXw==
X-Gm-Message-State: AOJu0YyTY4HTGLI9/ysLSg3fNyLp4hQ3zVTmArHaCw1PCsomQIzwwNYm
	Q2gjrawGRjZ8mzhIX4r5Yxg=
X-Google-Smtp-Source: AGHT+IGjshQ2RR3uLR3NR5XH4kZGq0bKwKJa9nFrnJR2Ve3ZB8NkzMtucWJSHIFp3cqZB2IgNChubw==
X-Received: by 2002:a2e:5151:0:b0:2c5:2eaa:5397 with SMTP id b17-20020a2e5151000000b002c52eaa5397mr4840794lje.11.1699890514398;
        Mon, 13 Nov 2023 07:48:34 -0800 (PST)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id d14-20020a05600c34ce00b00406443c8b4fsm14255122wmq.19.2023.11.13.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 07:48:33 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: macroalpha82@gmail.com
Cc: bbara93@gmail.com,
	benjamin.bara@skidata.com,
	dmitry.osipenko@collabora.com,
	heiko@sntech.de,
	jonathanh@nvidia.com,
	lee@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	max.schwarz@online.de,
	nm@ti.com,
	peterz@infradead.org,
	rafael.j.wysocki@intel.com,
	richard.leitner@linux.dev,
	stable@vger.kernel.org,
	treding@nvidia.com,
	wsa+renesas@sang-engineering.com,
	wsa@kernel.org
Subject: Re: [PATCH v7 2/5] i2c: core: run atomic i2c xfer when !preemptible
Date: Mon, 13 Nov 2023 16:48:26 +0100
Message-Id: <20231113154826.2856145-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <655238b2.050a0220.209e.4ad5@mx.google.com>
References: <655238b2.050a0220.209e.4ad5@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Thanks for testing and the feedback!

On Mon, 13 Nov 2023 at 15:54, Chris Morgan <macroalpha82@gmail.com> wrote:
> I can confirm I no longer get any of the errors with this patch. Tested
> on both an Anbernic RG353P (RK3566 with an RK817 PMIC) and an Odroid
> Go Advance (RK3326 with an RK817 PMIC). The device appears to shut
> down consistently again and I no longer see these messages in my dmesg
> log when I shut down.

Just to make sure: Are you compiling with CONFIG_PREEMPTION (and
therefore CONFIG_PREEMPT_COUNT)?

If yes, could you please also test the following patch? Because I am not
sure yet how polling can be false in a "polling required" situation,
meaning .master_xfer() is called instead of .master_xfer_atomic() (while
your test shows that irq_disabled() is true, which is basically done
with !preemptible()). The patch should test the other way round: if the
situation is found, force an atomic transfer instead.

Thank you!

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index a044ca0c35a1..6e3e8433018f 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1131,6 +1131,10 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 static int rk3x_i2c_xfer(struct i2c_adapter *adap,
                         struct i2c_msg *msgs, int num)
 {
+       if (irqs_disabled()) {
+               WARN_ONCE(1, "Landed in non-atomic handler with disabled IRQs");
+               return rk3x_i2c_xfer_common(adap, msgs, num, true);
+       }
        return rk3x_i2c_xfer_common(adap, msgs, num, false);
 }


