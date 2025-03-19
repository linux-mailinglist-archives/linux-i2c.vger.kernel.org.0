Return-Path: <linux-i2c+bounces-9898-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC5A68554
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 07:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB45819C3B12
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 06:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F85224F5A4;
	Wed, 19 Mar 2025 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caPBWETQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C25D24EF9B;
	Wed, 19 Mar 2025 06:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367449; cv=none; b=MFzSRFqHGCT8B1E+9IA8z3dt1O94vkgDMvXsma74jabboZGH+Um3fy8pyrCuPFakPtvguZwhBT+H3rRPPMHMkwM66AdXAO/ukAt6qOPn8YFYxelsng4+bYuBpDl8o9d+BVjTmjuFUOJlLc6IXvtj6cspFMNosuAEUXHZ5/J3nMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367449; c=relaxed/simple;
	bh=mCpTRzMCJB+v47eElDrA/ebK7+zwOda68H+kqorY/5o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IYhB5dvxoHZvAvZR3n2f3EV0TA/CqwsBounWG0k+oMyzvr/paz9+hRKHS12iUI8vS02WIkjRHwoDbxSdELSxVe2fB40lKDYc+qVHOCKjeC4BeVM7vLZdoiBixyyUF1pQVfvTtBvTqg3iLvzmwk/CTa+u9UhCSt27axZQmsWT15Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caPBWETQ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2260c91576aso55030885ad.3;
        Tue, 18 Mar 2025 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742367447; x=1742972247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcizybZfOtX7zd/8muYLl1W2Y9HegSIfPjr4unQ/52w=;
        b=caPBWETQ/JERiHI1ISzenTGbk1XDNe88uR5RMcOH8bHOB+W1nwtzjHlZUCQOXo5hpq
         8D1XB6NanYETdHpPvEQsdxplSRB6MuBU5H6tjaQCRIa5sqAIyJDy04kzoKUpgpP1JVMG
         M17Z18HQzjzNutv32Tig9lzHUUDNK67OVRWkS/hbmYYQpxwql0ix3/JX4I+wz/YRGPDN
         ckql3U7JXkiSaV5Z1uzN5zsspDUTRmFehJJaQtrU1YTdsmdINLDWQaPUs1cmjEM4B+jI
         HqSpC+32b2sZ1sjk4I5tVncbRGIb36VQGI8Lr69OiUS6tnZPRmS6Xpesxder1GsVnxa4
         2eLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367447; x=1742972247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcizybZfOtX7zd/8muYLl1W2Y9HegSIfPjr4unQ/52w=;
        b=X7lIgyOQ1ncfnVMPKxtrVNiTyoEgkTb1LX1bakzugTKx5/VS20J9bT2BaSsUfE0jbJ
         eZBAWjXB9oJg2fJ0/RjxmwBgv2Acb8lBjMiU/fqhV3y9zF91OlOoXgBxGxus2IryBaIc
         dK85mKEncF33ebczXn14HA8mZGrLY7FDQLdWsIfKJl1aWL6u5bS7QeSkCt5PLaw1D8kX
         ForFDaq5mpf27Ax3Y7IycNwBNer4mJL3AfUmwMI+MHEz9e/uPv1hq6WuvbbrtLEnE7tu
         7MEevIwD+SzyQettAqjxmMZDFqXKBiyfUyC18l9S8UPIjXNoWlK7TbdeiKI9K1+d3xOQ
         PqOw==
X-Forwarded-Encrypted: i=1; AJvYcCULfNOF+d4DbHZLEBTj6OR1bzkaRo+4XDgDRvGAZfTy42izPZm1xyRiD4brq+hrpB8I9TTqq7bA+fCwR930@vger.kernel.org, AJvYcCUof+1RODZ9LtkEaWNN3MrnRjPp4XUP2p4H0je1pFq0JDFu44Cy0c2ixc2YTnF98tQY/muR/DOJFRVB@vger.kernel.org, AJvYcCW1xorUO/Zf4Auq6LjPni7n+zJY+/7l7uPDPaSBH7nWzNLjbQFILW+kKhg/xghBKLSqOMNAZDv2w5T0@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxQjBBDy4bUOLF+xE3hzcFRlGF5opC7QRtH785Q7n9HxS9Dah
	QCPg5NLWF7Zw9Wm0gusTe/FLvIL8hlXIt2lIj7AbTB2yywAYq5k/
X-Gm-Gg: ASbGncsE++hIjTP/wuTbkW4B62I5o8S+aCoPMwTGLT/0LdrTczU1DiL1flbvgs6G2nE
	X5RusYIHodXp1T1pDl1JQXffRy80+jD7LmsWxh0fJMI0Do6KESC6dsHS9c8q25fG/eyB14VVIeI
	OSdtFVJUtKNWr6iSuBesmrozqXxqN6zPxy1Ia3f2lAKTsraC1c4MbiggqZ/BYtmrmeBAwJKQyXL
	9tlHoPQR71mEfe2G1f5n0i8kbPf0r55brKJnVccYkABe2spuC4NLP2fIkv4AJ+gN2JLefrQ7P1v
	c7YBMMPbZR06lqabWatI3o5DhrmgNA==
X-Google-Smtp-Source: AGHT+IFFwhNQ/t6dDSlJCbtxQ/cI6+UzpKK0sAxbXmmxiGE86fdpdk9WXkOD2IVcXL9Kox7DXY3lpw==
X-Received: by 2002:a17:90b:2f44:b0:2f9:d9fe:e72e with SMTP id 98e67ed59e1d1-301bdf91cc2mr3092116a91.16.1742367447258;
        Tue, 18 Mar 2025 23:57:27 -0700 (PDT)
Received: from [172.29.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf5b81casm741412a91.37.2025.03.18.23.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 23:57:26 -0700 (PDT)
Message-ID: <fbd59e2b-1d9b-4585-85a8-aec79bc10dd6@gmail.com>
Date: Wed, 19 Mar 2025 14:57:19 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <na4oeypp3a3qfaolhzvmj5b4s24zbgaq4vwsvm4wf2mefpcney@wuzszlh4ct3o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/3/19 06:18, Andi Shyti wrote:
> Hi Troy,
> 
> the driver looks good, I just have a few neetpicks to point out,
> that, along with Alex last comments, makes the v8 a good
> candidate to be sent.
> 
> We still have time, to get this merged in this release cycle.

Hi Andi,

I accept all of your and Alex's suggestions and will send v8 today.

Thank you both for your patience!

> 
> ...
> 
>> +enum spacemit_i2c_state {
>> +	STATE_IDLE,
>> +	STATE_START,
>> +	STATE_READ,
>> +	STATE_WRITE,
> 
> Can you please use the SPACEMIT prefix for these enume?
> 
>> +};
> 
> ...
> 
>> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * Unmask interrupt bits for all xfer mode:
>> +	 * bus error, arbitration loss detected.
>> +	 * For transaction complete signal, we use master stop
>> +	 * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>> +	 */
>> +	val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>> +
>> +	/*
>> +	 * Unmask interrupt bits for interrupt xfer mode:
>> +	 * DBR RX full.
>> +	 * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
>> +	 * need to enable when trigger byte transfer to start
>> +	 * data sending.
> 
> Can you please rephrase this sentence to something more
> understandable?
> 
>> +	 */
>> +	val |= SPACEMIT_CR_DRFIE;
>> +
>> +	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
>> +		val |= SPACEMIT_CR_MODE_FAST;
>> +
>> +	/* disable response to general call */
>> +	val |= SPACEMIT_CR_GCD;
>> +
>> +	/* enable SCL clock output */
>> +	val |= SPACEMIT_CR_SCLE;
>> +
>> +	/* enable master stop detected */
>> +	val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>> +
>> +	writel(val, i2c->base + SPACEMIT_ICR);
>> +}
>> +
>> +static inline void
>> +spacemit_i2c_clear_int_status(struct spacemit_i2c_dev *i2c, u32 mask)
>> +{
>> +	writel(mask & SPACEMIT_I2C_INT_STATUS_MASK, i2c->base + SPACEMIT_ISR);
>> +}
>> +
>> +static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 slave_addr_rw, val;
> 
> please don't use the word "slave_*", use "target_*, instead,
> that's the new standard. Unless it aligns with the datasheets,
> but that's not the case.
> 
>> +	struct i2c_msg *cur_msg = i2c->msgs + i2c->msg_idx;
>> +
>> +	i2c->read = !!(cur_msg->flags & I2C_M_RD);
> 
> ...
> 
>> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long time_left;
> 
> you can move this declaration inside the for loop.
> 
>> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
>> +		struct i2c_msg *msg = &i2c->msgs[i2c->msg_idx];
>> +
> 
> ...
> 
>> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * send transaction complete signal:
> 
> nit: /send/Send/
> 
>> +	 * error happens, detect master stop
>> +	 */
>> +	if (!(i2c->status & (SPACEMIT_SR_ERR | SPACEMIT_SR_MSD)))
>> +		return;
> 
> ...
> 
>> +static void spacemit_i2c_calc_timeout(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long timeout;
>> +	int idx = 0, cnt = 0;
>> +
>> +	while (idx < i2c->msg_num) {
>> +		cnt += (i2c->msgs + idx)->len + 1;
>> +		idx++;
>> +	}
> 
> nit: with a for loop you would save the brackets and the idx
> initialization.
> 
>> +
>> +	/*
>> +	 * multiply by 9 because each byte in I2C transmission requires
> 
> nit: /multiply/Multiply/
> 
>> +	 * 9 clock cycles: 8 bits of data plus 1 ACK/NACK bit.
>> +	 */
>> +	timeout = cnt * 9 * USEC_PER_SEC / i2c->clock_freq;
>> +
>> +	i2c->adapt.timeout = usecs_to_jiffies(timeout + USEC_PER_SEC / 10) / i2c->msg_num;
>> +}
>> +
>> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, int num)
>> +{
>> +	struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>> +	int ret;
>> +
>> +	i2c->msgs = msgs;
>> +	i2c->msg_num = num;
>> +
>> +	spacemit_i2c_calc_timeout(i2c);
>> +
>> +	spacemit_i2c_init(i2c);
>> +
>> +	spacemit_i2c_enable(i2c);
>> +
>> +	ret = spacemit_i2c_wait_bus_idle(i2c);
>> +	if (!ret)
>> +		spacemit_i2c_xfer_msg(i2c);
>> +
>> +	if (ret < 0)
>> +		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>> +	else if (ret)
>> +		spacemit_i2c_check_bus_release(i2c);
> 
> Nit: this can all be:
> 
> 	if (!ret)
> 		...
> 	else if (ret < 0)
> 		...
> 	else
> 		...
> 
>> +
>> +	spacemit_i2c_disable(i2c);
>> +
>> +	if (ret == -ETIMEDOUT || ret == -EAGAIN)
>> +		dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%lx\n",
>> +			  ret, i2c->status & SPACEMIT_SR_ERR);
> 
> dev_alert? Is it that bad? Let's use dev_err() instead.
> 
>> +
>> +	return ret < 0 ? ret : num;
>> +}
> 
> ...

-- 
Troy Mitchell

