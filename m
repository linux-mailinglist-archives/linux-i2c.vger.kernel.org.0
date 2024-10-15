Return-Path: <linux-i2c+bounces-7403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1E99F492
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 19:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35ACE284718
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 17:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1821FAF00;
	Tue, 15 Oct 2024 17:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ge+GnYMt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E448614E
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015143; cv=none; b=Ffmr+la9A9Ml7/nM7zTCzBFyiJ5uZjokOYNZ1v6+Jijb+DKC3kU6R2boYyi0X01oNZk8mgyXiX+j26E6BVIXar9RgNg6cxt0FkMolmrdREPEoZSmclY4Bf02q0uSK1uHVP6/8RNdDR5y9hihKQwR46QCPVN/az7FGtXBxEZTYmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015143; c=relaxed/simple;
	bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDu32hOVoEZuCCHFmn/G5SdHrxoyzpexJFcyGukvWJnZ5LiXHv1e2gzrDDyC+TlEyixDGXwP9vD6lcZ7xOq/PrsQYe6E4a31Z+swDbuDXmj3cvbJDnnHgHAQ+FgSuun0DPOq9TAvdhmT67JaadxOkuyL2nr5K+G/ThWwr1tyWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ge+GnYMt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f58c68c5so4297919e87.3
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 10:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015139; x=1729619939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
        b=Ge+GnYMtQ1ZqjL1GJtDqLGcryxlrqWUoUQWMI1RhLO34Jkwo7vQ1/u5Vdpb9KUD6sJ
         YtXBF7a1mMQ8zQKjtFnX5EfeaiQ4r4vhci2TrTSYNlNNaBYEEKRX/HjIk35pgdHx2Txe
         kZT9O/mLMSSDowKgLKojZEe3/bDdEKYkfeMrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015139; x=1729619939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+ea8ccZvUXgrS7wSLnvXQm/IOSNZR9uPNXAF5KAZsk=;
        b=GfvvjBVEkxSqjjjeXIiIRXpkIU8gJhCyjXUuwEH8lSwO5+pk0ndOwO2zEsa1AkjSqn
         coSx4GjsGQNXp2IV4r/czyt5at8pjrp844KDIyU3/+6t8rSl/U1OCcHDpyjudF8Pkb3P
         ahhDhpt0WUidJv81rcg9AwA2qlqTXr0ppDxTciksGpWQFMht93ESdGxhym/MPSZGZJAT
         bK6matRgZKTigWmeqMIscZDqM59H0p2WMBaglJj/h/NiBRu3CYy0qIcadyzJJbI62Yzr
         d0wDjTPg0nplLE+CtK9yQtAXkMxXgDf9TD+hjrTSm6p+m3YKgUT5z0+xBOZoPDgZ8eyN
         12AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+LYsvMq8hlXJmrGXP5DwJ1h56fhXS+DBRwe0ak3QbmFUWCdj/BoJ0nnsWYMZcMCfy+a5UHxfuGFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylchniovOfdi0WC9QeS5dt5vJyVE/cgBg0SyaVdtJjQxNArwoi
	IqTA0fNR9mSiO198H8RqGPviyfOZtbNXxIfxZLQSMxYH+t0Gj9B/lz81m5l+FIY1aVFticvacHu
	FXKcs
X-Google-Smtp-Source: AGHT+IFK7trrM2FWnSSJjsRK4s3x35X069nwk97oAOp2AbTPfN7HE8gT+YPd4ykj6bjP0P1qeu+B8g==
X-Received: by 2002:a05:6512:280c:b0:539:8d9b:b61c with SMTP id 2adb3069b0e04-539e5726913mr8589634e87.51.1729015138835;
        Tue, 15 Oct 2024 10:58:58 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa89fcsm226955e87.49.2024.10.15.10.58.57
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:58:57 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f2b95775so3272307e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 10:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWK0kEXISrdKKOKrMPsCStl5qJRElJC98ERHqVc5IQiyf4SKEojwN+grpcLXylJOF+r2dKqbh9W950=@vger.kernel.org
X-Received: by 2002:a05:6512:3e01:b0:539:df2f:e114 with SMTP id
 2adb3069b0e04-539e571c9femr7438846e87.45.1729015137476; Tue, 15 Oct 2024
 10:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-6-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-6-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Message-ID: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
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

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +/**
> + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C =
OF prober simple helpers
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages
> + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> + *
> + * * If a regulator supply was found, disable that regulator and release=
 it.

nit: was the double "*" starting the line above intentional?

Other than the nit, this looks good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

