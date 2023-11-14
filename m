Return-Path: <linux-i2c+bounces-159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F557EB690
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 19:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B567F1C20A9B
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 18:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33FC33CC6;
	Tue, 14 Nov 2023 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qgd4PSIA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06917992
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 18:43:41 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2082ECC;
	Tue, 14 Nov 2023 10:43:40 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b6c31e604cso3600393b6e.2;
        Tue, 14 Nov 2023 10:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699987419; x=1700592219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iad1M7sTlxmoH5/Gz+DQ7dI9dCA8jhAGqNXduqEs6bo=;
        b=Qgd4PSIAU6ZL/6b7ELPOhZ8QxtHywJnhZe0b8NpNrxH5K4Lxv/zx6z5whEoUipPGmv
         kpmweA1T6DPnvnjmC13iz1FULNZhfBSMf54vj/vhGwubz4bdgOd/BXuiwe6am3IdoOrn
         Tnvn7wVjcRReZ7WZy/7cXMA87Z0thnCxWvMmYitW9dutvupZIBDJ9NMQMlAVySaZBpNb
         +roKSWPbe8fCwOA/vUCaFsvOUqv0AdxIrd71J36DKayRPPcg5BQe5DTv5/yISXPGoDsF
         qCCWbKGEa5fxe4M3VRj7l3rBYlt0Ihlf3SSTkyNElVL8titV65+NgTOCe/fmylI4bbRB
         KRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699987419; x=1700592219;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iad1M7sTlxmoH5/Gz+DQ7dI9dCA8jhAGqNXduqEs6bo=;
        b=fdRFVbFn/A7vcBTB7DXJN9goOOSObSF6Jn26xwlvtgGyk1i04cv+SEeyeyE9qQE7L5
         Sk+83agVGyYei7+JwFFOyfb6gUdNGIcKTdJvmAoxb71T5aAXzVdyngPQUPKkBQ2MQfRw
         xYVyd7+EbJzekRPEsc+4pJ1ybNSncFurx3dFb47svUfZOxEG4MgLgqFx+oF8WUOmOYJK
         FMMtvZeuM2zfwk+Muo4K1DvDqt+hnhNVwof4Ti48e7/MhRoKK7ldkvsurL8TMvFXs/Yk
         negehR54GFVYtqBUwgaqVWGyV/RvzMcujEsW67iDE7AE3HVKwQP8cxrzdKxCzV54sPn8
         Bmsg==
X-Gm-Message-State: AOJu0Yx9vS60JEH7STlAoQ+AJO273YAJXYgqM41R5PMkm4LqYAJ5/9ZN
	9rTusgTQQyKGJXnbHZQiwo4=
X-Google-Smtp-Source: AGHT+IH98vlzW4/W9fI0+WeMmjyz/fdNutPArPXFhZ5iM81GrHnw6IYD0fyPYRqcN6w9w9NBy4yOGg==
X-Received: by 2002:a05:6870:3d99:b0:1e9:8780:a0e with SMTP id lm25-20020a0568703d9900b001e987800a0emr14899288oab.28.1699987419384;
        Tue, 14 Nov 2023 10:43:39 -0800 (PST)
Received: from neuromancer. ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id ec21-20020a0568708c1500b001e5ad4b2f65sm1470312oab.19.2023.11.14.10.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 10:43:38 -0800 (PST)
Message-ID: <6553bfda.050a0220.b2675.7cce@mx.google.com>
X-Google-Original-Message-ID: <ZVO/2ZR/bzbmbiVv@neuromancer.>
Date: Tue, 14 Nov 2023 12:43:37 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: benjamin.bara@skidata.com, dmitry.osipenko@collabora.com,
	heiko@sntech.de, jonathanh@nvidia.com, lee@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, max.schwarz@online.de, nm@ti.com,
	peterz@infradead.org, rafael.j.wysocki@intel.com,
	richard.leitner@linux.dev, stable@vger.kernel.org,
	treding@nvidia.com, wsa+renesas@sang-engineering.com,
	wsa@kernel.org
Subject: Re: [PATCH v7 2/5] i2c: core: run atomic i2c xfer when !preemptible
References: <655238b2.050a0220.209e.4ad5@mx.google.com>
 <20231113154826.2856145-1-bbara93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113154826.2856145-1-bbara93@gmail.com>

On Mon, Nov 13, 2023 at 04:48:26PM +0100, Benjamin Bara wrote:
> Hi!
> 
> Thanks for testing and the feedback!
> 
> On Mon, 13 Nov 2023 at 15:54, Chris Morgan <macroalpha82@gmail.com> wrote:
> > I can confirm I no longer get any of the errors with this patch. Tested
> > on both an Anbernic RG353P (RK3566 with an RK817 PMIC) and an Odroid
> > Go Advance (RK3326 with an RK817 PMIC). The device appears to shut
> > down consistently again and I no longer see these messages in my dmesg
> > log when I shut down.
> 
> Just to make sure: Are you compiling with CONFIG_PREEMPTION (and
> therefore CONFIG_PREEMPT_COUNT)?
> 
> If yes, could you please also test the following patch? Because I am not
> sure yet how polling can be false in a "polling required" situation,
> meaning .master_xfer() is called instead of .master_xfer_atomic() (while
> your test shows that irq_disabled() is true, which is basically done
> with !preemptible()). The patch should test the other way round: if the
> situation is found, force an atomic transfer instead.
> 
> Thank you!
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index a044ca0c35a1..6e3e8433018f 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1131,6 +1131,10 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
>  static int rk3x_i2c_xfer(struct i2c_adapter *adap,
>                          struct i2c_msg *msgs, int num)
>  {
> +       if (irqs_disabled()) {
> +               WARN_ONCE(1, "Landed in non-atomic handler with disabled IRQs");
> +               return rk3x_i2c_xfer_common(adap, msgs, num, true);
> +       }
>         return rk3x_i2c_xfer_common(adap, msgs, num, false);
>  }
> 

I have CONFIG_PREEMPT_VOLUNTARY=y but CONFIG_PREEMPTION is not set.

Thank you.

