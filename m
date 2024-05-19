Return-Path: <linux-i2c+bounces-3585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A31888C93A5
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 09:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3D81F212D2
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2024 07:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B5B14AB8;
	Sun, 19 May 2024 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcNeYOhl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D93B666
	for <linux-i2c@vger.kernel.org>; Sun, 19 May 2024 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716102920; cv=none; b=qo+svG3c5MJZp35ZU58UuhWIgq2Eph8LtButvF/fMb8b8jjy/XF2tHn/KrfSeLdgd2cJzqcBoESKeK7xbsgFPJK3wW5h37rCg8VKxv86ISge3E0XhYQGRpNstwd27VLr/UTHkWpqDiUno9nf5xLT1y5684OMH1PJXRW6YGscVPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716102920; c=relaxed/simple;
	bh=ZrHiVPvry11DhTiPCVllavorsYpCjhP6RqrkbqANw5I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CyftvUNK2L5tq6UVUGVBeAuvPLJK/5f9G+NDAaFwWL1164l4z52snPTLiZrrjCIw1eiL8nAT+31oTUoaRcC6WqVr/ZNBO6MCD2JugWSPEWnmuARwEBKzX8M7h4eaALYb9cCVlP0d8yODDWqH4TADj+ibIOATEiAt4fXUPbGZ/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcNeYOhl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f72a29f13so2515531e87.3
        for <linux-i2c@vger.kernel.org>; Sun, 19 May 2024 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716102916; x=1716707716; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrHiVPvry11DhTiPCVllavorsYpCjhP6RqrkbqANw5I=;
        b=gcNeYOhlF5n/MbHbMQAI2WCLcLCZzeRKXOBOaXhwQPUnIa7OxNEktDbqh4si9d7XG8
         2SMwhDeWC7rCRBBE9BPkW/3O50GQvocZQzh3CZjFwiFWjuTeKlkH2XrkqG9he7/A+Fsa
         ZYZRLf77/PnElsQUr1fhGAeE9KwVB+dlVo5sIWE/TaG1ln0uAgT6EKPNj6lQ+9/YnPDJ
         EMwL3PTXjUWrfsJR7YbhsJ34lri/6YN6tqxtspkzcQ0RntwD/a/vuzyuI7ShZYnnyaBm
         QzlSah7C/mmydRp1E3HuSpA9Nta9TjKqW54xMCcu11qmqJKclTN6u2r1AN0N42DvtndB
         J1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716102916; x=1716707716;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrHiVPvry11DhTiPCVllavorsYpCjhP6RqrkbqANw5I=;
        b=Ha1yj2Bhnx7cDWV+D4V07o0tmEvBzHByjhGO+Ll9b0PvDBzkK9j4qV7/ga71mIy78e
         y0YPhZ0OaHFpK6leVgCPTlbYMZRkDsJF0bSfuJpaLq4b3txk6ESRPWQ00LCQv4iPkWPC
         zZ6e8W+Q+X5qx4gvdU3e5mQoDY8VlRek1xkJLOOY4lu+6HYCEufDpNpDl8TLtWYdJyqQ
         5ZsVK3tGMWjJk5mNLhCp317ts8nF8Fm54PNmg435jxgQZxObApAqKXm87IB+a4JF5LOh
         Vk2EME/SmGxgmsiEiSoRz0AAnwjNR1YeM6NdaZcpA7lUnsbnPCPe37j7NQHM/M2FgkWK
         9lYw==
X-Gm-Message-State: AOJu0Yxa9q4neUMI7yvLfRdTbViIZTHjj0RRRYl4El5YLwUEOn/DUyen
	kzBfLDOhkDlZXpp2wvadF5/6z/LxriVdhNenyn5/FL/hmlD/xoU1LQnw43Duf8IuX9rCHVvF0Sy
	OfLvqg9MQy8h32T2Q6DTT77/OGTlrSg==
X-Google-Smtp-Source: AGHT+IFNzGjl6AZZRcxy9lqW6DWdZrrwCWCreQIL+9YWjMOgMtIN7dXpqODNpeYa8SPN9twH0sFVvo1E65BaouxWsWk=
X-Received: by 2002:ac2:4c55:0:b0:519:6e94:9b4d with SMTP id
 2adb3069b0e04-5221057930cmr22814058e87.48.1716102916211; Sun, 19 May 2024
 00:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: James R T <jamestiotio@gmail.com>
Date: Sun, 19 May 2024 15:14:40 +0800
Message-ID: <CAA_Li+t1vFuHPx+ySijxPme3+2Jyg_ekY+7X2df-Fh5uQZH08A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Increase SMBus max block size to 255
To: linux-i2c@vger.kernel.org
Cc: matt@codeconstruct.com.au, dns@arista.com, jdelvare@suse.de, 
	jk@codeconstruct.com.au, wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,

Replying to the cover letter since this email refers to the whole patch series.

We were looking into support for SMBus v3.0 in Linux and found this
patch series. Could we kindly check if there has been any progress on
this?

From what I understand so far, a previous version of this patch series
was applied to netdev/net-next.git (master) but it was reverted via
commit 2f6a470d6545 due to concerns over ABI backward compatibility
from Wolfram. Then, Matt submitted this v2 patch series which has gone
unnoticed. It has been more than 2 years and there seems to have been
no responses to the series so far. I would like to gently bump up this
patch series so that we can hopefully move it forward.

Thank you.

Best regards,
James Raphael Tiovalen

