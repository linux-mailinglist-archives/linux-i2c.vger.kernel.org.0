Return-Path: <linux-i2c+bounces-3242-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8E8B40EC
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 22:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C2F1C2209F
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 20:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA212C1A3;
	Fri, 26 Apr 2024 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pf8jGySc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC129411;
	Fri, 26 Apr 2024 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714163903; cv=none; b=Jkt4VepWqgDUWlSlexXaPHfsgnp9ot899D0IDtXBqiu0bGHPjKDIh9qJG57Wev4dVqd/Fzna4FjCnndd+KuOwQp4KaeVCOqbCzd/4lY6CHLYYfhoj+5JyhwvjypRPrZwBvmH1Ait38u9cNOmk9FHnS2io7RcJ4POA8vqnihyxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714163903; c=relaxed/simple;
	bh=26fIsN8LMhPXlfknTM2vpoq+uq8fejMYjSlvP+Hn5S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhBNebr9UD8AjukfXKN8wfBmKOeP+NOkLijp8TOTA30tSHkRL9nJH2ty7H2xlCAS+OkBOUJ/I5SPO/nNyfi9bgrriFeB+N4Mi1GcoFiQXJkgdv+wkYqIvonHmm2ETuHk+RTAjrvHYIsE9AJOm04RKIn+RU0aBYcEHHKyeuoTaMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pf8jGySc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA96C113CD;
	Fri, 26 Apr 2024 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714163903;
	bh=26fIsN8LMhPXlfknTM2vpoq+uq8fejMYjSlvP+Hn5S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pf8jGyScXrzsqy2ahtnIiDL1+9whu+NaGRhNMUZxxrLjNXcSSTfiocq9ZzTByrlaZ
	 L7pa4ZzE1PviE4l7q26PRyhLQgmq9s1T5Q3wtw6W4WwiLP+m4B14SD+Sh8LJKs2QJI
	 tV+5BXlK74iGF8GDErke0tvGuiBDhaQ7ZZ/6UGY0=
Date: Fri, 26 Apr 2024 16:38:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chia Hsing Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Charles Hsu <ythsu0511@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: Add infineon xdp710 driver
 bindings
Message-ID: <20240426-fantastic-charming-pheasant-64f7fb@lemur>
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
 <20240425153608.4003782-3-peteryin.openbmc@gmail.com>
 <4e329d1b-fad5-416f-b0ca-55e8c6c3394c@kernel.org>
 <CAPSyxFQcKvpvO2-U7QPjrVTqam_bQ6OP8VoomnSbmEj4g7uDVw@mail.gmail.com>
 <d1cc7b23-32e9-4326-851d-88708ba28052@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1cc7b23-32e9-4326-851d-88708ba28052@kernel.org>

On Fri, Apr 26, 2024 at 10:20:58AM GMT, Krzysztof Kozlowski wrote:
> On 26/04/2024 09:12, Chia Hsing Yin wrote:
> > I use b4 download and apply it, I think it is a tool issue, I can fix
> > in the next version.
> 
> Just did it now:
> 
> b4 trailers -C -u -F '20240424095604.3425857-1-peteryin.openbmc@gmail.com>'
> Calculating patch-ids from commits, this may take a moment...
> Grabbing thread from
> lore.kernel.org/all/20240424095604.3425857-1-peteryin.openbmc@gmail.com/t.mbox.gz
> Looking for additional code-review trailers on lore.kernel.org
> ---
>   dt-bindings: hwmon: Add infineon xdp710 driver bindings
>     + Acked-by: Rob Herring (Arm) <robh@kernel.org> (✓ DKIM/kernel.org)
> 
> 
> And no quotes...

Yes, this was fixed in b4-0.12.4 and b4-0.13.

-K

