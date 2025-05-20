Return-Path: <linux-i2c+bounces-11053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE4ABCC27
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 03:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D92303BE29B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 01:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4835A1F4622;
	Tue, 20 May 2025 01:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9Y2e7aJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013931925AB;
	Tue, 20 May 2025 01:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703947; cv=none; b=TYknKEji2UNb6fWpgF5nrgGwvniX7Me8mtZkB1YDoNIJZp8D0Ck0f6s/sGLxIYIYrGR23nFC/qBnNrtDvYjYaaeFM+bdq4NGFdmSFQbHpJEQjyq8bB7gB+23j8oGKtFo8f8xD6zfNsBamU7R9LUef9XX5LfA6cqd2FzGgoEPtv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703947; c=relaxed/simple;
	bh=G4aPdd5xmKRbcbQlhzyQMbZx9/TLUlO5A9dahVYLtaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7ybY8hX3rLOhivqtTSn70xVZQYV9vaZjgeTulB+yjuoVTsZ08j2xZ7xE5L1JBtXL4o2VDaw/gi0K0ZWY26CFT4pxn86HUtLuUSCf7z5p34YzJDG5JMbGGGBCuBwZMGJud1rh47wkvWpgxvY0m3X2W7Ay0rzEPumVpd4Cjz91KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9Y2e7aJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E72CC4CEE4;
	Tue, 20 May 2025 01:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747703946;
	bh=G4aPdd5xmKRbcbQlhzyQMbZx9/TLUlO5A9dahVYLtaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X9Y2e7aJYjvP4slqpjofRqt296IpKBETASQWXoYy9YfAwAUrOlr+FWSK9rdnJj0gg
	 qW+cwRZlJKGnUaKNwoxHczQERucPo943WVeFegolBsWMlVUvpzEXm9CsosYnY0vMlw
	 RtKUqFOWxXx44rjpEyaF2TFS0ZiiOFPcrnQgbuL3LxEq+IX+JIb/xhnFQESHasbpk9
	 fLPCU5NdR6SuUl7o7lz5i3gTn4SKhvmkPQsqIzA3rS4NvpdjF+Wzqu/Yt24MoCxWid
	 h8l2w3vGBnM/H70MVdD6JIPSS7h1/2vRAz8EEnyypVPTiFQPGCn4qAvJzln0ROFNa8
	 p9B8h+FIQbBog==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad56e993ae9so321031766b.3;
        Mon, 19 May 2025 18:19:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDZWfJgdTjEG/uo79ZL28TA4i6/BAAn5orEwRU3Cq6LV1BmKdEcJTgP4BoczLxLFlAvIM8lqfaKm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoEG4yp66enhJ+Ib0Ml0RSeXDI77o6uryKFoWHbxE85ByWvcU7
	jWgMvHMx41TON64O1x+YC57lMJfTuhx+VsPsU3S95Fb8O/6qT9Im8K+gyFhuF/g8mGuf5sT36Yf
	sEppZOD189pt2AT7YZ51q4A55+3w8vg==
X-Google-Smtp-Source: AGHT+IG1XX9q3ALw0Ni3Hde4U/edGGtw3+3n5GutCO3WXokNU0QbZ35V8TZViqZtIdqMVTYWW38j+lSij8PfGPEDv8s=
X-Received: by 2002:a17:907:2d1f:b0:ad2:23b6:149c with SMTP id
 a640c23a62f3a-ad536dcd710mr1111456266b.43.1747703945016; Mon, 19 May 2025
 18:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519184530.21845-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250519184530.21845-1-wsa+renesas@sang-engineering.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 May 2025 20:18:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+UCU8RdAGVPbsFDo6aaAyoAKtjDd4yYfs47YOt__VhgQ@mail.gmail.com>
X-Gm-Features: AX0GCFsnMJZiN3WRYSaBT1-5w9d7aKTcQWuBTke8K_xG4WEYtTDnnUhPZWJi8ws
Message-ID: <CAL_Jsq+UCU8RdAGVPbsFDo6aaAyoAKtjDd4yYfs47YOt__VhgQ@mail.gmail.com>
Subject: Re: [PATCH dt-schema] schemas: i2c: Allow '-' in 'i2c-.*' node names
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree-spec@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:45=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> When allowing extended i2c node names, the '-' character was not added
> to the character class. Fixes the following error:
>
> .../Kernel/linux/arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i=
2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

IMO, we should change the node name to "i2c-0". While I'm on the fence
whether it's worth changing these, I do think it is worth not getting
new ones.

> Fixes: 647181a1f8ff ("schemas: i2c: Allow for 'i2c-.*' node names")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> I don't know if it is possible to define a custom character class to
> avoid similar problems in the future?
>
>  dtschema/schemas/i2c/i2c-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/=
i2c/i2c-controller.yaml
> index 8488edd5ecc4..4abcf1a0ddcc 100644
> --- a/dtschema/schemas/i2c/i2c-controller.yaml
> +++ b/dtschema/schemas/i2c/i2c-controller.yaml
> @@ -14,7 +14,7 @@ maintainers:
>
>  properties:
>    $nodename:
> -    pattern: "^i2c(@.+|-[a-z0-9]+)?$"
> +    pattern: "^i2c(@.+|-[a-z0-9\\-]+)?$"
>
>    i2c-bus:
>      type: object
> --
> 2.47.2
>
>

