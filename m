Return-Path: <linux-i2c+bounces-7462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E99A2F1E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 23:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799312833D6
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 21:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0F422738E;
	Thu, 17 Oct 2024 21:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ndL5N6au"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132D1D1305
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 21:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729198976; cv=none; b=VUITn0cfrJuJ0xTeISAabMsR8y7cGiR6UiwhXYELpCSWSH0UqtcdENYzeuMYUtb/UNcKH7tWQRv8+9FfiYc+ahq8YQ4GEtsdrUVGSSE7TfOrOI0SSmFqIP0QD49DyTPqnLOylbgsxCGOOhmGyooWJkXc2FuC055FCwtcOUdglhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729198976; c=relaxed/simple;
	bh=qwfWpxeyhpiPKYSudRqo5jr8XsgShlrd1VLDFv5fJFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIKE/L/y6mIUNj9rK1tTIwvxs1TEU4qtqAU4pAU/H6z2bw4Bl7jQQ6ifNLk//c16WVKAiyoAYtTCJpyS3FiQ7U/9hQAhqwXo2IbPxfRFtXdGS63AZ8SZnlUQ01El7zwYDmm8we9OJ1nYU/IxEkHXFGc2cxXXZI+KgXMw7tDzyn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ndL5N6au; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so1607930a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729198969; x=1729803769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=;
        b=ndL5N6auo1ZtrSz56CG3CWeNMqWvik5wdpe6LwtmJsmTZsmXtJtM6jF0qsiMV8EyPc
         /bQCl1qx0jH1AYFHeWIWofKyhYc4Na4OGKmFg5iUpVPckF1aH4gucyYHzv/hSrIWprga
         5grN2Gnzhx104x4bbMXz9ps1li0xzhqF/TTSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729198969; x=1729803769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=;
        b=S7ZCIIEWB/Om1aKXPQKQB5bRyTQX/pLF8Bxa8/cLsePhyaraxseAhUXmkGNDv62Kf1
         QpBvtM6iYuXh4Vk43+jcUJpyFR+q9w7GmAtQMZ0SI3FSpgE71LCotp6bJ5PS8UX1lwcM
         7Rl3K7T8WNXXjIEE3jKlE9nCY7LkO4V1wFH2EnNpbRzcyjfPj8Y5JB0vxsJdcRxoJPaC
         UBAqd0CHiU5zu4Ws5s3jaqIHdLLb0nKVGuSAVZOIQ+mFjE5QlrVLf7Wy1k/ACkAibaBT
         odddE7V0DPIfsukee/pz9azebaJnrHNDzQj3J+oKQsuMKHsO35A9o9n8Vj50QeIXt5WE
         GKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxEqYeyNxR1yfMaQT/k6NblOAZms4MfzkMRnc+exKuA8ElzYjhuIEJrVlu4SSZ/O+zNT/HxvRjjow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcK+3xPxvPnW8xvTBF3azKIX5PLs/xkfPi5L0KHw+xFvF0EHxR
	0BdrUGm3BiXBg7x743+O5VT3Nluyt5qUKfbuvtXF/ckU4KXvAzyHDxSkN5ir6Tl7gBMpYWot6zr
	DSQ==
X-Google-Smtp-Source: AGHT+IHmUPqVT6n1usZVyUJWzGS3uNePTVtGjr9lIkXL9vip/7M/GceurOco8Xbb2Xqr/Oonmyr8Hg==
X-Received: by 2002:a05:6402:40d0:b0:5c9:4be9:7c4 with SMTP id 4fb4d7f45d1cf-5ca0af8767bmr55240a12.31.1729198969265;
        Thu, 17 Oct 2024 14:02:49 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b0e87fesm8211a12.78.2024.10.17.14.02.49
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:02:49 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso1075977f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 14:02:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUTRj8Fzo/e+ohzZVsddULnH0MnjA2OVncrvKlQL7jyaF08f4z9qSSfNRSQKT8mgM9xN6d0TNkIvA=@vger.kernel.org
X-Received: by 2002:a5d:45cd:0:b0:37d:39c1:4d3 with SMTP id
 ffacd0b85a97d-37ea21de065mr215420f8f.6.1729198968725; Thu, 17 Oct 2024
 14:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-4-wenst@chromium.org>
In-Reply-To: <20241017094222.1014936-4-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Oct 2024 14:02:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vy6q-nPZ99k7t8-G_osefg=0jxPUWm8F1uhtVw0xDvxg@mail.gmail.com>
Message-ID: <CAD=FV=Vy6q-nPZ99k7t8-G_osefg=0jxPUWm8F1uhtVw0xDvxg@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe function. For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds=
.
> It will then enable the device that responds.
>
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v8:
> - Added missing include of <linux/kconfig.h> to i2c-of-prober.h
> - Expanded description of i2c_of_probe_ops::enable to mention that
>   returning -EPROBE_DEFER is valid (Doug)
> - Reworded descrption of i2c_of_probe_ops::cleanup_early to avoid
>   confusion with i2c_of_probe_ops::enable (Doug)
> - Reworked i2c_of_probe_get_i2c_node() to return NULL on failure,
>   matching most functions that return |struct device_node *|.
>
> Changes since v7:
> - Dropped log level of "enabling component" to debug
> - Dropped file name from header file
> - Reverted to __free() cleanup for i2c bus node
> - Corrected "failed-needs-probe" to "fail-needs-probe" in commit message
> - Fixed incorrectly positioned period ('.') in commit message
> - Expanded description of i2c_of_probe_component()
> - Expanded comment explaining check for "available" devices to note that
>   if such a device is found then the i2c probe function becomes a no-op
> - Simplified check for "available" devices for-each loop
> - Expanded description of @free_resources_early callback to explicitly
>   state that it is not called if no working components are found
> - Dropped !cfg check
> - Replaced "fail" with "fail-needs-probe" in i2c_of_probe_component()
>   kernel doc
> - Combined callbacks (.get_resources with .enable; .cleanup with
>   .free_resources_late); .free_resources_early renamed to .cleanup_early
>
> Changes since v6:
> - Correctly replaced for_each_child_of_node_scoped() with
>   for_each_child_of_node_with_prefix()
> - Added namespace for exported symbol
> - Made the probe function a framework with hooks
> - Split out a new header file
> - Added MAINTAINERS entry
> - Reworded kernel-doc
> - Dropped usage of __free from i2c_of_probe_component() since error
>   path cleanup is needed anyway
>
> Changes since v5:
> - Fixed indent in Makefile
> - Split regulator and GPIO TODO items
> - Reversed final conditional in i2c_of_probe_enable_node()
>
> Changes since v4:
> - Split code into helper functions
> - Use scoped helpers and __free() to reduce error path
>
> Changes since v3:
> - Complete kernel-doc
> - Return different error if I2C controller is disabled
> - Expand comment to explain assumptions and constraints
> - Split for-loop finding target node and operations on target node
> - Add missing i2c_put_adapter()
> - Move prober code to separate file
>
> Rob also asked why there was a limitation of "exactly one touchscreen
> will be enabled across the whole tree".
>
> The use case this prober currently targets is a component on consumer
> electronics (tablet or laptop) being swapped out due to cost or supply
> reasons. Designs with multiple components of the same type are pretty
> rare. The way the next patch is written also assumes this for efficiency
> reasons.
>
> Changes since v2:
> - New patch split out from "of: Introduce hardware prober driver"
> - Addressed Rob's comments
>   - Move i2c prober to i2c subsystem
>   - Use of_node_is_available() to check if node is enabled.
>   - Use OF changeset API to update status property
> - Addressed Andy's comments
>   - Probe function now accepts "struct device *dev" instead to reduce
>     line length and dereferences
>   - Move "ret =3D 0" to just before for_each_child_of_node(i2c_node, node=
)
> ---
>  MAINTAINERS                      |   8 ++
>  drivers/i2c/Makefile             |   1 +
>  drivers/i2c/i2c-core-of-prober.c | 182 +++++++++++++++++++++++++++++++
>  include/linux/i2c-of-prober.h    |  75 +++++++++++++
>  4 files changed, 266 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

