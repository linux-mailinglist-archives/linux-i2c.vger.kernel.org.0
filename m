Return-Path: <linux-i2c+bounces-13699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61BBF50DA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 09:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 513684F8D72
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 07:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5762C28000C;
	Tue, 21 Oct 2025 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XxyjuCio"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2A27467F
	for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032788; cv=none; b=ZnErf2tCZh1iIzjO3jSNiDjxwh3+Crf1IMVD33fzIajbIBum5m5ulAmincPSrXwUJ7m+mTjvcqDEFXse2bTPoHTiEZaGbfaJq5bfD8+jIapFXCwntEzYuUkX7Bm/akMV5iGTDBv6BtBqAZk2T9PUqh21PttO8yvSZPrysLNlSLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032788; c=relaxed/simple;
	bh=LVH6YFEYhmhEPWh0df7RK4ekzNwAtISSU0LB8tDTTss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ERt0jakFScaXHLUrRpKZAK5gxHFPqK4GB95W3yDUtlTnKaVjMAqx/E4RN7gqMJQ41TsZbJdPGHTy8LLwFNG/rktrmTkuS3Gx/zQjkeH/Q7/oQNmpRcnJ8KohpY8VpxxpgU7d/5HJNHoLj8EMe/8DDWeQOY1+yS1ccRL1RQC9ock=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XxyjuCio; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7a1603a098eso3256830b3a.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761032786; x=1761637586; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBpqb2+7U3Q77M+8OyMtM0kBeb1iAjGz8t1p4/VxoQI=;
        b=XxyjuCioULcSPz20Zlki0mzx5/zRssV86Dh5RXr1fxf4lQ2u1MPYSve2GDbRFW5Tvm
         SlkFUAEc8t9Zh35n3DjhuVYIzr29QFoTAQEIohtzjeu6+21rVRqk/5GBnWLQOZnsgCMN
         9Ls+Em9doxxUblunLlOXYoyigAr0OBaKJf1awEYzPIpMLrJNAZjqVtSVq/FxQ64Ibkyy
         +9ftd3zmsblGFI8hmTW2RLWS/cGONcYNlvzmaAvKt6ZXvnhRTORTyeMPB1ybNk8IL13d
         UjiYXhRSLajhozMZUD1lYbas3BdJH+qcflnWZi3QJQL3P1R0oQkdHw2h5Vm1HUPl+zOe
         3BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032786; x=1761637586;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBpqb2+7U3Q77M+8OyMtM0kBeb1iAjGz8t1p4/VxoQI=;
        b=jjBdHZGmR3WwwhmnlBWCoERmtrBX3MJPeKvvyIunxPhF53//PevaRk0vjCavxngZj7
         TUOpB9BdnISAb9qHkwlQisGBehrkxjhP+Rf/Tdl/1AH0tTJkrOoXRhgotb61725FEIeJ
         jgTwRk3qJFkqPlG5Dszv3X5bPq8JnlaVaEmNmRMsb5y3QuJlrVRmeeaOdeZpKRT7W7K9
         WSLqwOo9Rl4BcWppgqzg89vI/8MxmVJsjHjBXx3kd85XwWizgFbnPR6P8TGd2kBW4wSx
         b44C0ZtvJflm7TF6swch9rhy0VB8ZTBfLWvUCIlxsB7xaQEnsPsFgILepHXmD6n+tV2o
         49RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkno3kKjb29Z8by/88fmff25ft3tPwxpI0b1bMmoQTwlcdJyRKizClMd6gMl6MOk/HHdCI+ox1rlc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kCALjRnNjfhsGVjx7EzCuTSXpWXrCR7fNJbhV9Yjb9LjbwX5
	BqbOm3OXen2R7c/XnGk6R0PJHtDl6YHPDFgiagskoMnh8zcQF41p1wyrlyQwgjRHNA8=
X-Gm-Gg: ASbGncshVnVTSzaY4dtuacRkXwrmJAX5NpIYs5ZsT6L6vuUhiW5q/F0f5JHDVEgdx1D
	4bNS9GpKJ2/Uzl/KZ6ptpzmqdc9mWZpDxBgQbfR6vL6Gib3xlp543tFbBmgPC8Ue77yr+1IoWb2
	HwofuFtjycrYBEk2MtQvAaHsWla9I1sPpUFwARHXzZK4ZBmBASAjR4vxpp5Yawsh9rYCD7Ybord
	CIfXG8pJXNPkdDxEk9/VepvJWxYHoqtFKcoKx6pqPB/+keXcc68inspnDHD3WYtROHZJSKO/WLL
	REPpaApB8avVlRmXwiuRCtBZUJgyX/k8urzBc57spRl9tYJySgtKGFGTisnHuLd1TXBOnp6Oe1d
	NqQmNRgaD6e5XQ86owtCk+x259vxZiXm2f5AIQcn9h/k8cwVkEx47xio+tYX437ryQDlBnLBZFn
	1NJw4Wu+Qj5VyAdcu4o8pjeE4vLeqP1NOduz6+8nacE4k=
X-Google-Smtp-Source: AGHT+IG47Jfs0++8lUpVeSVSV3SoIwpIc8P5gxrMy8RFysFpxvUaPb7fzxEPRj0y0D99gnOCvjvo0Q==
X-Received: by 2002:a05:6a00:92a5:b0:781:1a9f:2abb with SMTP id d2e1a72fcca58-7a220afeef1mr18606220b3a.24.1761032785740;
        Tue, 21 Oct 2025 00:46:25 -0700 (PDT)
Received: from 5CG3510V44-KVS.bytedance.net ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff184basm10575094b3a.15.2025.10.21.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 00:46:25 -0700 (PDT)
From: Jinhui Guo <guojinhui.liam@bytedance.com>
To: mika.westerberg@linux.intel.com
Cc: andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	guojinhui.liam@bytedance.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
Date: Tue, 21 Oct 2025 15:46:19 +0800
Message-Id: <20251021074619.3638-1-guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251020102958.GL2912318@black.igk.intel.com>
References: <20251020102958.GL2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Hi,

On Mon, Oct 20, 2025 12:29:58 +0200, Mika Westerberg wrote:
> > +static inline void i2c_dw_disable_smbus_intr(struct dw_i2c_dev *dev)
> > +{
> > +	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
> > +}

> I wonder instead of this wrapper, can you just do this in
> i2c_dw_init_master() right after the adapter has been disabled?

We can do that to simplify the code. Patch v2 is sent and has been tested.
https://lore.kernel.org/all/20251021072431.3427-1-guojinhui.liam@bytedance.com/

Thanks,
Jinhui

