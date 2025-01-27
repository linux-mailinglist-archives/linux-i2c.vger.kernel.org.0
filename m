Return-Path: <linux-i2c+bounces-9215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58835A1D1C7
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 08:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5FFD7A2CBD
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jan 2025 07:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD21FC7F3;
	Mon, 27 Jan 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJNiZMNU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEFA172BD5;
	Mon, 27 Jan 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964293; cv=none; b=hdBUbeykKTxbb+3/R2F+Gxj45TjuHzgV/slArkCBEN2TiJnsU0WsXJwX5YqENjebDuL0NCTfSrx7e4q2A1LjldyyxOlbOxf6Asf1E5/PrOXO/zWW9RN0JNa75vfearHOzbc2BIacJkjpT4KT/uthK9RyI1uvSMBOPxVruMAtiZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964293; c=relaxed/simple;
	bh=TTMl1Oj/RAcVPOSHA1vncS+HEaFPeXDpEO1sP2e94ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoAfSFvA1s330QPTYtl00uJSfNQAjEgmWqT/VPRbo01MIc2RrxHBaZ6NMuvPOofN48oxBZ8omteRPSG+Lkp48by8OoBgK/eQQn8Fv7KLRx/8QhLrzkNkd7tSCO1jxqPqdlHvufbn7rwYYCJBN5WYqp/ioHaVteTNaYmUh4nDqDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJNiZMNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F19DC4CED2;
	Mon, 27 Jan 2025 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737964293;
	bh=TTMl1Oj/RAcVPOSHA1vncS+HEaFPeXDpEO1sP2e94ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJNiZMNU1sM/bL2YpfGzauv+yG22dhdxvb9/Ve+RKvpb6V17PRQ5dP+Ve7fTZUKtI
	 ix1Rl1D4sM7GjlknFgh3lobyZMiuhgYat1c6OfKh42IZjdIXS9mx+hcWiiV+F5774p
	 PkeJ4myn4JeHMDE64uNeKzUPE6lmHnanz0S8lIruKfsZ3W7+XhAbTlHTHCh7zPlxGc
	 vHDWBXaxK/EXRv5ZvVNIvoR82YDc5tdHvfhotAnFCGayRifmoG9vFW7MEnGyl6bE3a
	 gMV2yQTdV+a5v2btI+w1+1Mgn8YmS3J+eUEpGHrUs/jE6p2ig8+1W+82SsMrXOqO2g
	 R2943gpa5yUhQ==
Date: Mon, 27 Jan 2025 08:51:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ltc2978: add support for ltm4673
Message-ID: <20250127-uppish-pastel-cricket-a86d00@krzk-bin>
References: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
 <20250124-ltm4673-v1-1-a2c6aa37c903@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250124-ltm4673-v1-1-a2c6aa37c903@analog.com>

On Fri, Jan 24, 2025 at 11:23:05PM +0800, Cedric Encarnacion wrote:
> Add LTM4673 to supported devices of LTC2978. Unlike other LTM46xx
> devices, LTM4673 is a =CE=BCModule regulator that outputs four channels.
>=20
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


