Return-Path: <linux-i2c+bounces-15310-lists+linux-i2c=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-i2c@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIQfOuvVb2mgMQAAu9opvQ
	(envelope-from <linux-i2c+bounces-15310-lists+linux-i2c=lfdr.de@vger.kernel.org>)
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 20:22:19 +0100
X-Original-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 738FE4A33D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 20:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A013C9660B9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B3C477E31;
	Tue, 20 Jan 2026 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tda9PqQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D11C01;
	Tue, 20 Jan 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924430; cv=none; b=TcuZoxpRafURRHCXlCud8gzxMfX06LGlz7oBkt5yrTDcCJ94BsyLQEeB7IYaOMfJfCkVyz9lgU6sZTLAqH4AbHsrCcFrxo9zpdNcY2D+KCQ6/l/JoRlKvC4QeZCj0lQTJQw9zGxlRL1w2t6uMjlbV3s0b7C/XMr85qlATfPsDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924430; c=relaxed/simple;
	bh=2lyQ956y/cjzj/E2Ndhkr/nFnx1nEeiq4PAxUbapuuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZVJIHOfGIoHuSYYBKcFyBvCQdYwBWhBItxuZBWeZecRtSMsT2wn2NVAyAM6EM9MicQ5PFAJCq+9k0wiX3UWVtNQtguWVnPwyoj3B+DBJtaRLdBPZdsxj1xnlR7I1WjorqAmkoUHzPyeyOTT6m9tOm7AwR3hEZF3XiXrtS7+iVk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tda9PqQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF38C2BCB6;
	Tue, 20 Jan 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924430;
	bh=2lyQ956y/cjzj/E2Ndhkr/nFnx1nEeiq4PAxUbapuuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tda9PqQf6mdU5ZN2ASc03cnbHIaazXkfER9jbCeHOVDKmaYXcnps15COS5KzH9sk9
	 q8b4Aa0lwNs26Nrq6ObHD2+UYOeAUb+PmoWGV4v5Rf0qj/hRiRV4irKDn7SxXLsI+X
	 A4C8phW1WNMqXH4vQKTyAJm2LWz5zZCMnVB4HfGGA+q2YSbruVNNX+9c3/nu6Xi8ZW
	 7biB1Ph8RRFoUdg7mXSUjARCaQhrJ3IcDgm92qSiY8USKG5kSK4pQSSiSljFezBN7H
	 tatat8ZmbUyGWWnHJ2hZCQ3YnD6MOGK2P+BYCAfmLdIcWadbT8fFTEyV7Dv9shvaDl
	 ZSEpuqTQeljdA==
From: Lee Jones <lee@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
 vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
 lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251229184004.571837-3-robert.marko@sartura.hr>
References: <20251229184004.571837-3-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v4 02/15] dt-bindings: mfd:
 atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Message-Id: <176892442293.2297977.2838802915163703902.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 15:53:42 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15310-lists,linux-i2c=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-i2c@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-i2c,dt,netdev];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 738FE4A33D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 29 Dec 2025 19:37:43 +0100, Robert Marko wrote:
> Add binding documentation for Microchip LAN969x.
> 
> 

Applied, thanks!

[02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
        commit: 41d1f3cf1f52c75f72ce1a3e2f2ee82e7c6eb59a

--
Lee Jones [李琼斯]


