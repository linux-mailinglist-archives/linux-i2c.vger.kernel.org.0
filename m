Return-Path: <linux-i2c+bounces-9884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8099A67D71
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 20:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3F3C19C48FB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 19:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C76211A0C;
	Tue, 18 Mar 2025 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="tthe6w4p";
	dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b="LwxXGaSM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361A20E6F9;
	Tue, 18 Mar 2025 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742327743; cv=pass; b=CpNX87Qsgdu3Uy0CXki2Yq7PNqt/iJQ7bBChDd5j2UTDeGsXTT+3sd8/SNJdr8hatZNUH1eFlZW9D5wQhZo1ZvAmfNgQXzCGPXWFOmXmTA9Aa/oaREIJK6VBu+ohNDav27uLdyBHXz8yZwdcS1Kbp2Y7XltGrzLnNDQpBtdreCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742327743; c=relaxed/simple;
	bh=lJkRNO6cs6CcaT4ImdkOxXpcH/ClXVAKxOJlRwIsc1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rd0DMy2Vapb2ohO9QqAJRtKYIp0T6cX6zBF6dPY+YNmxemWqhLpEa47SR68l8empIqGVP3zYLjFYvhLp1WYBDtE08DHNLxBJtreNhGmchE28ab3XBTE0V2sFVcmqZDpLvvzUjFhpdFVp0n+aPdxl1X64+PxjU5NxyoNXNst0YIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jm0.eu; spf=none smtp.mailfrom=jm0.eu; dkim=pass (2048-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=tthe6w4p; dkim=permerror (0-bit key) header.d=jm0.eu header.i=@jm0.eu header.b=LwxXGaSM; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jm0.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jm0.eu
ARC-Seal: i=1; a=rsa-sha256; t=1742327713; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jDX0H0wUBOXPQ0tBLgKawwOcKVteea9eQobp8SE9kIeReighELZGIflOKyaHNSZn6p
    Mdizqy82QGV1HDfl7e5JGeWSv3A3mjDFPc415afLazwcW11cpLF++RFO7jq/QikUmEom
    7JTypmJysHPdwLNtsKnnMj7I0X+zmUWdYLEnTjP4ddS0JUfaHQsrrjZhdIi7lszepc4m
    Qy7SEGttoGmaE7JlxqC+qDFpj6Vw8RPEE168eLgp8g/gVs8yd3Sr5mrCCl5XTgwRaB87
    VX/9VpoLwi7Iyv6g4Xp6dBlf5WeQi2dtivE8c3YvmP8EgheHi7VMOyq+lxUbvSkaGgFp
    P9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1742327713;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=IMFRQPqxsxrdpFDHtTDmw/F5TMStNFJfDOO0t2v2NBY=;
    b=ex24Rgd6zDwiTAWW8XGvGlmTK6qofHTpDlhJhIlTYtG2jQLbeIsegbKagqqHiOeVvb
    L1csRgf7OHd/2i7HRTzqlJA2zazy3oCiArvfpaawhbKVhMtE3DYqNv3dAJf63hSGI+2+
    P6v/yvl4EIzeBdqSClXuf7bv95MQRPZxVu0lx12WTdPg4A9X5djlJWSVn0yGh2OBngIW
    o9RxBRzYJxIt0zfKqcPiTa240+ngY/MOKREnJ9LQ1lgrfsOVc6vTIXO+3Hpfw9J4eAuV
    rWtwNh2BOJcUp1FjcT4qSFhxkHeNfnO350WI3DN/JTR4DkBvrCzp5hSlyFNgZcFPY/7F
    87sw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1742327713;
    s=strato-dkim-0002; d=jm0.eu;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=IMFRQPqxsxrdpFDHtTDmw/F5TMStNFJfDOO0t2v2NBY=;
    b=tthe6w4puOOjLQOGLkp4xXJvVp0mtQ9Qf1lFgxcDFRC+z7ZCPTTlq3Nu0LffKmdHV9
    JirpmRptY6PcCa3npwQ28yNxul5gBNUTZ6WUV7tJp8nO0Esj+YxlEizGQO9BiNRq1pDz
    oJrcpcVuaXNGKM2WP7/hfws6CE72vDVmRnIQCRv5g1m7ihhFh7oL+Zd0mIkk81is+SIS
    vFyoG20RLvY2IGLRub8XEZUMHF663bCuN1WMO13//tJBiIxElewpiIGl8KvK6Go7iHVX
    WqMOgCNaTjajKkhZKZ2gla+2ID8qmModUD2VqZ8MYvuOy7ls3bRZKRhBOvpnMbT6t6/k
    w7UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1742327712;
    s=strato-dkim-0003; d=jm0.eu;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=IMFRQPqxsxrdpFDHtTDmw/F5TMStNFJfDOO0t2v2NBY=;
    b=LwxXGaSMrZb+MVZOJfQdgqITb+TNnBetgapSSb9emkFA9UqRvdw4C+kKI5Xq7/L+lN
    o53jdzpC2S5wTVC0c7Bw==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPTeoCaRth8YQvpoIkZXd2bnDIrOV8VCY="
Received: from [192.168.1.232]
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id z292ee12IJtCJ9h
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 Mar 2025 20:55:12 +0100 (CET)
Message-ID: <59651605-45fa-49d7-bb15-dae83d8ad471@jm0.eu>
Date: Tue, 18 Mar 2025 20:55:11 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: i2c: omap: Add mux-states property
To: Jayesh Choudhary <j-choudhary@ti.com>, vigneshr@ti.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250318103622.29979-1-j-choudhary@ti.com>
 <20250318103622.29979-2-j-choudhary@ti.com>
Content-Language: en-US
From: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Autocrypt: addr=josua.mayer@jm0.eu; keydata=
 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
In-Reply-To: <20250318103622.29979-2-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jayesh,

Am 18.03.25 um 11:36 schrieb Jayesh Choudhary:
> Add mux controller support for when the I2C lines are muxed after
> signals come out of SoC and before they go to any client.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   Documentation/devicetree/bindings/i2c/ti,omap4-i2c.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)

Is there any chance for this to be generic across any i2c controller
regardless of SoC in use?
Is this perhaps also generic to any device in dts,
similar to assigned-clocks?

E.g. in k3-am642-hummingboard-t-{pcie,usb3}.dts we have a mux on the 
carrier board switching a serdes lane between two different connectors.
It would make sense for pcie and usb phy nodes to delay probe in a 
similar fashion.
The same may hold true for other buses muxed at boot-time or based on 
assembly options or extension cards.

sincerely
Josua Mayer

