Return-Path: <linux-i2c+bounces-2382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123887E74D
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 11:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619891C21CF7
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 10:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3812E859;
	Mon, 18 Mar 2024 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmoK1sgR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1432E827;
	Mon, 18 Mar 2024 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710757474; cv=none; b=DUbZrNTswbCtNLFuadx3efJNIOWaDzf4EpDe2FFXGVuQfnWeytpNRF70sb0JTLL1eRNXzO9pnp3bjUDWKFQBfUgKOZrzqYGpAejHzLtd0W16CHi762AtO+DDEE64fXAu83we8YeDq3fj48N73Vm7676Ae7FHuWFHci8mJsl8n1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710757474; c=relaxed/simple;
	bh=ery6NRFC2rTlrIrfvpDvhH0oInDvwM5WelThauRvuDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMaaLUC7abaD5Pi90jL7zhncqhrRxSVFrcLAktqESJ64p7p94sAejoFtdpvEiaA34W3hsMoVfMlUGMnFDVN14/8b0GdJm440veBYdx0beii1s2yoGCzfMtvp9XhFczCBG7qSLcBRVhaFsH1TY+r0XLnTFL82qx0RvueQfB588wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmoK1sgR; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-514a8259ec1so199335e87.1;
        Mon, 18 Mar 2024 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710757471; x=1711362271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntj7D+3C8Siu9Mte/gOo4b2BDgoQlvmaeXCzlwHfd0=;
        b=lmoK1sgRotMr6NFD81+Fuxb7w39vRuu3qzIlp5/t81ZYSPIrB+nEXjSPSXA9ToVdRP
         Mp8QTJNDSfCEdf0hy9c11DxO4gdb1rNEhW+DM9FWJP97zaafW+2d3XaeS9YrefzBMZVt
         56rUxk3on4qAtXt/7oW27ezG5I1B61LHeyEIsZoSZyQ9eCpxb2s5wx6nWE/gv+xqT+e4
         RPixKY/E5KSRst8RPeKYf6hzFy0RXhg9ZIAHdGIKmUfmbzulMy6yhSxNNSlnv5uwAoqs
         VdkP7CsyGN84cy3IFrYldmq4Btp+OJdM2z4O7G/vqSHXNuUTZbvF5+t8mKjVPY3bMI5+
         u6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710757471; x=1711362271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kntj7D+3C8Siu9Mte/gOo4b2BDgoQlvmaeXCzlwHfd0=;
        b=QUwCpQ+2LXHBHkKcLQP/seKKZDiHJGoblUMyRpKlpganhdi6XGV0lTvhkXhtl3vHRy
         qWkgSe8UCCBmjJUE2EeYcta1cPmEhY/ogBg/a8OgmCjMHV82aroi0JHmrI46DWJfIjwW
         8I59bGhQoBr9RI/6qpwkhLCqpVeJe3rcwHuziHNYpcFv1frJg6ruHSAuYnMu/84Fip7l
         Zp/ImQdjVeFN1pM/TQOIKTANjhNvg6HbOaQGA/WrbKJfsg74nCp2fIQB+ntra5/mM8hx
         HlfcC8fIHnJp9Yb2EUclTRlj6nTCcUZc78D6sHg1HPIyv726BQEtkVmNfQeTS/q8tBxw
         Dx9g==
X-Forwarded-Encrypted: i=1; AJvYcCUC23pS2NdAqIiNXT7aANnvfWkPolTn/inVKxfbbkU0xGXJNytORUpXyEAbM2DE4T7V3E8Q6OQd7HRJvFpQtgqTyRm+mV7281Gz+WFWuH2YQQikLCjnSsW1RQ0yhvHDWIJB5Qm73LOh2O/s6MOASI4eXMWG9HZY545KO3CT1sUzuXyTZ/4=
X-Gm-Message-State: AOJu0Yx5GWurtCdzu3awWEpozeeRcrU54ezuT6BUy5tRXmO9wiWyypZY
	j7zzdigmBvP5AwFfJUNlSGshMaP+6w9ssCn7H+sg6nxQQajL4wXgpblX2OehT68P3tyZndiSpiw
	GbOLRgMMNL+e9NzAf9B72uHXkfE8=
X-Google-Smtp-Source: AGHT+IHkUAoaQCQVB1qIDuqXpEBKlFEHkJrtN5qFI394gASFx2wCpRpaQSzqetL2Hg5oBfbO6L7QeYXCho3lGQksddk=
X-Received: by 2002:a05:6512:485c:b0:513:ca84:3a0e with SMTP id
 ep28-20020a056512485c00b00513ca843a0emr6709998lfb.58.1710757470631; Mon, 18
 Mar 2024 03:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240317222718.3e03edb1@namcao> <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
 <20240318100108.4fafd72b@namcao>
In-Reply-To: <20240318100108.4fafd72b@namcao>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Mon, 18 Mar 2024 12:24:18 +0200
Message-ID: <CA+eeCSN+tsyL0OdR2owrFHiSj_dWNyw0Z46mUMND41O5xxTWKg@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, 
	dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 11:01=E2=80=AFAM Nam Cao <namcao@linutronix.de> wro=
te:
> Nice! I assume I can add
>     Reported-and-tested-by: Eva Kurchatova <nyandarknessgirl@gmail.com>
> to the patch?
>

Yes.
You can also add link to upstream RVVM repo if anyone is interested in
reproduction. This RVVM patch applied to 0.6 makes a keystroke storm:
(window_update() is called on each display redraw and has access to hid_kb)

diff --git a/src/devices/fb_window.c b/src/devices/fb_window.c
index f170e2d..17e2519 100644
--- a/src/devices/fb_window.c
+++ b/src/devices/fb_window.c
@@ -77,6 +77,11 @@ static const uint8_t rvvm_logo_pix[] =3D {

static void window_update(rvvm_mmio_dev_t* device)
{
+    fb_window_t* win =3D device->data;
+    for (size_t i=3D0; i<100000; ++i) {
+        hid_keyboard_press(win->keyboard, HID_KEY_LEFTCTRL);
+        hid_keyboard_release(win->keyboard, HID_KEY_LEFTCTRL);
+    }
    fb_window_update((fb_window_t*)device->data);
}

> I am still confused why RT throttling doesn't unstuck the kernel in this
> case. I will consult some people and investigate more on this. But I thin=
k
> this patch is good on its own, so I will send a proper patch shortly.
>
> Best regards,
> Nam

RT throttling kicked in *very* rarely, in most cases where the unpatched
kernel was actually stuck RT throttling wasn't reported at all.

It didn't hang every time either, so it's possible that RT throttling
helped sometimes, but not enough to always recover from such a loop:
[incoming IRQ]->[IRQ claimed]->[no handling]->[IRQ completion (which
immediately triggers phase 1 again)]

Best regards,
Eva

