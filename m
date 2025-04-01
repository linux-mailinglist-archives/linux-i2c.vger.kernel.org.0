Return-Path: <linux-i2c+bounces-10078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1837A77D25
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 16:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE4D13AB57E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 14:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B17D2046BB;
	Tue,  1 Apr 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUEkvlT4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A15B202F7B;
	Tue,  1 Apr 2025 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516217; cv=none; b=hxZfhSjCgZxQdi7vhV0u+yRzrvJ6i3KbQs5+MbxVpN3b2mkPyJi9H87VXQZAwvnjR/pPXgwB9Wk2lhrOPTLhxnl48uaTpiHK5li72GzXVNExrGQqm3fxRCK2XFqDSalYKH5pZjWVa1sNjrCwJe/Q3Z35QLTVTiH0fmlK0MwFGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516217; c=relaxed/simple;
	bh=0RKd6oq67uWIV2Q9JVMsvpnbRFAKV+wogJ/TuhTjTHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngCKtbYjTxGUYk7Uz87P9f+vwpvuYU3ZznAmH6rnxy95DL5+HBig9yT/iCoE3Ix6BYx7D9ZodVzK68RqkZWNLzF12xvlR3UDr+6L2wgKXzm3ERoReWwGnr9dHEmbb+Oi1mPYjb7wjxK4Hg3dX7YSD9MLFP9P+HJaZGm8mTgvuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUEkvlT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B234C4CEE5;
	Tue,  1 Apr 2025 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743516216;
	bh=0RKd6oq67uWIV2Q9JVMsvpnbRFAKV+wogJ/TuhTjTHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gUEkvlT48z3jr40KllXU3HwV3jBkMSZ5ZWaQaTb67GtmNpTpGkIZbW5tCXB20iCT/
	 6QWweipAtNR5K728mYbikDy7mYUH6+R0b9dMhdtNF4XfVQgPD9/XgGdhFts+QIhosn
	 hM+i/1Di+Gcyuh9C+BOhAysBcfXCteR2l3D5sSyDGIzSlprlM2MErwK+6IpJpiLbJc
	 ZRQR7MnqM6jtIc0r8oO9TUpEjStyosLZhDXj7mVqDjwQOm2RUUBWC4pS/6D2XyUvyu
	 PO+n9OLGke+6XMbgkv0abX0J3nZpBUgqtu9ibT+6NHeSCsMuVp93iHwIUKeT7Cqtyb
	 eciuoTFZZ+R/g==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so10450092a12.3;
        Tue, 01 Apr 2025 07:03:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUndpOEZ2Vw2htAt1yQZ0c+QqHDGo0BA+/3h8aKdU2z3i56ui20uJXec2+no5Q1y16Dc8n+dss7Pgyp@vger.kernel.org, AJvYcCWTrB0YpF3iOGqWHySjF9Wie6TZ6wuST0icHpNiVCt5GuEVMiG4BJ8o8LAsdj0eFNFWqRwcp9MNDS5jPvaI@vger.kernel.org, AJvYcCWpqs2B3MIY+cZAkLKHfzYERGVtAQeXaVCPOFBl6vBpXdj4cAJMTc3zIH05WKAsXMFnRx0ULwlTzWGG4w==@vger.kernel.org, AJvYcCX+AYvi9eyxxyAjWBED2bb9FxvJkqIlQyVS8XTNp0ZSCWkjUkdhFdSFjypQ9w7EH/4kXlohteSoTsuHC13K4Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ohkYekrUTT6ZMr952iiMXEmSM4mEk2zHKB7LiDwF4Yq+/Rvy
	IOezz0J5kyrNo3iO9MBRV+QKFoEY7fpC+/kLlEvgAcH/6YBbRYY2E1+JK0DzUpQJ+kqB4Maq/Ax
	/SmC4d7SBgv3ypc6Vdd0QQUhMUA==
X-Google-Smtp-Source: AGHT+IFzoZbUPqDeYZjT5xtEjxq+tcB/eZ2eQGd0UQkFJzgfaNvYWG1GjgFMjCniyE6HAjXZwCVCB1wg+dFAtCBeOCI=
X-Received: by 2002:a05:6402:1f83:b0:5ee:497:4b4f with SMTP id
 4fb4d7f45d1cf-5ee04974cdcmr12296382a12.33.1743516214916; Tue, 01 Apr 2025
 07:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401081041.114333-1-herve.codina@bootlin.com> <20250401081041.114333-3-herve.codina@bootlin.com>
In-Reply-To: <20250401081041.114333-3-herve.codina@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Apr 2025 09:03:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKQdzDzAYHDctP-nmrONBynRfi-qyncnyj10r4xZNrx1A@mail.gmail.com>
X-Gm-Features: AQ5f1Jrl7NVlqsPoX_Cqx9U5EDG_95BPE2e4WCqYw6qGyWJsIaZB1GmpR7k8jG0
Message-ID: <CAL_JsqKQdzDzAYHDctP-nmrONBynRfi-qyncnyj10r4xZNrx1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] schemas: i2c: Introduce I2C bus extensions
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 3:11=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> An I2C bus can be wired to the connector and allows an add-on board to
> connect additional I2C devices to this bus.
>
> Those additional I2C devices could be described as sub-nodes of the I2C
> bus controller node however for hotplug connectors described via device
> tree overlays there is additional level of indirection, which is needed
> to decouple the overlay and the base tree:
>
>   --- base device tree ---
>
>   i2c1: i2c@abcd0000 {
>       compatible =3D "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {

What does 0 represent? Some fake I2C address?

Why do you even need a child node here?

>           i2c-bus =3D <&i2c_ctrl>;
>       };
>       ...
>   };
>
>   i2c5: i2c@cafe0000 {
>       compatible =3D "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus =3D <&i2c-sensors>;
>       };
>       ...
>   };
>
>   connector {
>       i2c_ctrl: i2c-ctrl {
>           i2c-parent =3D <&i2c1>;
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>       };
>
>       i2c-sensors {
>           i2c-parent =3D <&i2c5>;
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>       };
>   };
>
>   --- device tree overlay ---
>
>   ...
>   // This node will overlay on the i2c-ctrl node of the base tree
>   i2c-ctrl {
>       eeprom@50 { compatible =3D "atmel,24c64"; ... };
>   };
>   ...
>
>   --- resulting device tree ---
>
>   i2c1: i2c@abcd0000 {
>       compatible =3D "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus =3D <&i2c_ctrl>;
>       };
>       ...
>   };
>
>   i2c5: i2c@cafe0000 {
>       compatible =3D "xyz,i2c-ctrl";
>       i2c-bus-extension@0 {
>           i2c-bus =3D <&i2c-sensors>;
>       };
>       ...
>   };
>
>   connector {
>       i2c-ctrl {
>           i2c-parent =3D <&i2c1>;
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>
>           eeprom@50 { compatible =3D "atmel,24c64"; ... };
>       };
>
>       i2c-sensors {
>           i2c-parent =3D <&i2c5>;
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>       };
>   };
>
> Here i2c-ctrl (same goes for i2c-sensors) represent the part of I2C bus
> that is on the hot-pluggable add-on. On hot-plugging it will physically
> connect to the I2C adapter on the base board. Let's call the 'i2c-ctrl'
> node an "extension node".
>
> In order to decouple the overlay from the base tree, the I2C adapter
> (i2c@abcd0000) and the extension node (i2c-ctrl) are separate nodes.
>
> The extension node is linked to the I2C bus controller in two ways. The
> first one with the i2c-bus-extension available in I2C controller
> sub-node and the second one with the i2c-parent property available in
> the extension node itself.
>
> The purpose of those two links is to provide the link in both direction
> from the I2C controller to the I2C extension and from the I2C extension
> to the I2C controller.

Why do you need both directions? An i2c controller can search the tree
for i2c-parent and find the one's that belong to it. Or the connector
can register with the I2C controller somehow.

Rob

