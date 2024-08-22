Return-Path: <linux-i2c+bounces-5667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C723F95B5CE
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA882854E6
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 13:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB971C9EAE;
	Thu, 22 Aug 2024 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK9JipIq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FC1C9433;
	Thu, 22 Aug 2024 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331594; cv=none; b=FWAW644Zek4U98AeKYAj1g0CEq1Uloe1k90ywg1ZeCruaQbT+8KAG4oXckr1/v/H95rOZZBLrWT5FwGtTdnQby94G5NHwIwOsrT4YjHXy7P276+YklgFm9CwoKFJWABtPiBh0v4TV5/O3EHj59FHErRqwO6ezxXz1XTx8N3rcqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331594; c=relaxed/simple;
	bh=EoO4sCNWaPPWmdIdCr2gmgPkfl+OMgV/V6faIdi9Nng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw3g69T8H15iNclaOacCzLQUn8aNW2isevgWO2EHxgtei0+SUmh3YMiMxMIVsXV7UHQToeEYcDtJXGQPQEega44iKjaFPLAguuvGzfcplmltJE350ho+H4o6gg33Jm7TM0gvW7YIgUZk6FyvKfAZBEXTIYhETUFWSrQ1kGVIv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK9JipIq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5320d8155b4so886002e87.3;
        Thu, 22 Aug 2024 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724331591; x=1724936391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoO4sCNWaPPWmdIdCr2gmgPkfl+OMgV/V6faIdi9Nng=;
        b=kK9JipIqoBUfNQV+XpvgJRqJX7NIhBhayht5HhZQsmUBtzUaGg0tu/ouY1RwA4sbFe
         DPUsLTVBPe/s/+EIxXIIIW7CDF6ooeKqM3iDNEh8HhwMIeNZ4PnW8/MmXez95JPgLei7
         cYl6CECjdJNq1GJ7EpMjMd1pjbiN6/Wz2ksxpjWSX8AjFcdGoE53nqp4wLDMrZXxWNGR
         EKoK+vN8M6UMwwl45i8FybMgDm7rxGmVpMBsmjsoSCjV9mIkqKOf54P0DndZljdX9S5m
         QizBIA9L3PZTbU+NcNDhov1GgPfT4Xt60fzgXsGjb2oYgKxDKXi6LTwV8utO8div8nLC
         3L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331591; x=1724936391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoO4sCNWaPPWmdIdCr2gmgPkfl+OMgV/V6faIdi9Nng=;
        b=Z3r78fj85CaekfcyJFjNvpjVAOA2PZxvZ4w4F3Mf/6Kwciu9QhLS9bIFhfvX9DbohO
         iZO88TC8TmklgGiD2laYDHL6jwpRx/QCnbhChlscLDEiMGWyww2r4Az+QnOBhQxnQYFL
         yeq2fdZsfTUuCN10AsoU/iKecZ6dqopBxrj6f8WVxLKCVvmlYZOsv09v+vlr+wCuct6I
         BvKXKPSx3LyyZ73+HlRnwsMwZeJLc02bu83hiO+Dvpiz2U7GyHb7luMAOpuIariGgpVI
         BK7gvqDKikBMH5t0HfhSOqRXxXjGMh3I9U/yJt4Mdr912gQ29ap/4W7N4rzFtT8liNr6
         yI5A==
X-Forwarded-Encrypted: i=1; AJvYcCV3TC0yO/Kaeot3tbEqyrTt9/3kHkOR6asDjFhpFsOyuvH8xrXgsi+nZ2hjhRrmHZqHUfqbOst3HQqPbO8g@vger.kernel.org, AJvYcCW3sbdCesUeFAdSaci+7kITOA/jLH28ek3sUxUQxAtTSdpllbN8x5XTXWbzMP3CiLIYlxKGqscHdiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdpxwIiBJTst+YnWVr5b/7WzdHYsx9CcyYRNiml3XTiq01rAz
	wjoIGGQLA7V7Ug34QO/k1RPCy4A+/8WdFJxRPX8n0owh0rKcSoDrcoyDHlx3M4r2xIgj1vk+8hv
	Vve7nA0F5/7NZTdzg7Tp4FNbZEUI=
X-Google-Smtp-Source: AGHT+IHS96aclJuolbPu0Uu3VPQBNy/41oHFLnv1W7KA1hySaSp8ImFVHLor+SorMz+bK5ND7I6vDrYc1U7/dyqzntQ=
X-Received: by 2002:a05:6512:3f12:b0:533:4191:fa47 with SMTP id
 2adb3069b0e04-5334fd54882mr1147315e87.47.1724331590564; Thu, 22 Aug 2024
 05:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819072052.8722-1-eichest@gmail.com> <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
 <CAOMZO5CeT+LvQ__3GUf6teL3=8pZe5qxmFffYJX-h3E27UXwtQ@mail.gmail.com> <Zscl99sSlbhOTrnQ@eichest-laptop>
In-Reply-To: <Zscl99sSlbhOTrnQ@eichest-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Aug 2024 09:59:39 -0300
Message-ID: <CAOMZO5Bdfe7fqJCCy9nqRG9jbOEKDNymMHp+--PaTygs5pZfFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master mode
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Thu, Aug 22, 2024 at 8:50=E2=80=AFAM Stefan Eichenberger <eichest@gmail.=
com> wrote:

> In your setup, do you know what mode (atomic, interrupt, dma) the driver
> uses when it works and when it fails?

On the imx8mp board I am testing, the very first I2C register write
done by the pca935x driver fails.

Thanks

