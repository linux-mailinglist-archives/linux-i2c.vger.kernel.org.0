Return-Path: <linux-i2c+bounces-7721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC229B9351
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 15:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 431A71F23413
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 14:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4588B1A3A94;
	Fri,  1 Nov 2024 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYY84Nou"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D24179A7;
	Fri,  1 Nov 2024 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471653; cv=none; b=u+B4cKHmaXlCz2e7YQHdbAENhmY2WQ16RIs27GfXvGpeWBQE4c4GHu+B8KzcTc+A5n6x621UNpS3D+Jm/hCbutGnpVL4yCXQMbp/NJCTZcl7lquCb9fHIsTkw+n1xHbrFNvbH+72Ffk5ySKsFkwfs4w2f6WLuMkQAKBf82phErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471653; c=relaxed/simple;
	bh=C/knSqVXKMl2zcilQewOi3O837JguObUEaxNatfarwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbILEVSASLDbvyw7Mr02z3F0gDP/65aYhZ5t0UFRNYhgAx/ZdrmmNERl8LiNrb8SIQhoSAMoeclCw4ZpqXsYv2yjmXAZzQ8BhIr3GX2wiketh7njfuW091foA88ugqrHfin+uXsR5Bb21nvAOFW8JoaKO7NDLlVl4fgqB0v0BN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYY84Nou; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c767a9c50so20815765ad.1;
        Fri, 01 Nov 2024 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471650; x=1731076450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eou5SUE4bsXaY7azZD1lAI4QmeGX00MbRztMD2VQb0k=;
        b=YYY84NouUL8/hFs7TTEadcULBNEJTO9IJwgByfBXaRr+UQflp4kXDRpuI8Qw3CkgFk
         rxkvmKSNzl16oALc5val9mXXz6znXTStyeEy06pj92qunseTZIS46t73k2e2um2PqPK3
         NS3ZBp9qQ+97GWS0cp24qN8bXjbZhmhghDm+2QVUW9IZAgnh/J2w4Gsr86sPh6dqt3Zy
         AVjbD2k5Z+mn3xHfeUAR1SWFnC8KkSsdRz3yVOXr2i01yNohGD3Q6q0kfPlX9FobI5i5
         FfWpeikauodS9dGVpQan69KNPeuSIxPv3KeVLapTX74v1CUWgQ457y9jf/HgFg0spwDH
         iK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471650; x=1731076450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eou5SUE4bsXaY7azZD1lAI4QmeGX00MbRztMD2VQb0k=;
        b=v6uThMrggLc4z/p/tthc+u+UusJW9C4Nr0CE0mIeeWNln8rYJTHtaiqgMyEGDHvKEP
         onn+fWWZ06zDwTSyB8Izaj4To+5xvsPTGn6KqJ9hL3hSTc3zv/6Y7xMmL5aJnQBQ4mY2
         IEAm9UeCMBvg/HHq2AATrWv3tT+7fTOnAhE7w8KYMoTe6BfngO10ta8O/eN3AMVBQwOh
         LIJYEHK2ZJ0TqWBYOvIgKrj7/FAF8UVEajJq2j3eLrY88xeQ5QSWi7IfgbLYgTKDqMGQ
         ZnAwPUYdXWEjQ+Al0jNG8XEINUogb9aC3ZRQw5DayLepEOWlR3Zq/XAvgCan2Dppd3BL
         XVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwujSkuiwo05ZgumU7EmbFrSGkpL48MU37EcBUxmXJTeIRTmXzfiZOgsPNi7UuexnWeLhqTfUUPhD/XZg=@vger.kernel.org, AJvYcCXA9cNUDqeTjWMEHKphobVKs97y8T9B6hsbubSLtPiWVPIggdKXDa7fAlRrtww866/uQV7PajUDVEwv@vger.kernel.org, AJvYcCXfOOvppUbNM4HfgtsmT2AsX7wAExegNp8lXg2PAN9gAHpruQGEuuA4nftXu0kEAYzTY/aqsHjlqr72@vger.kernel.org, AJvYcCXhZEQ7onyFivZhlQmXb4hHr8mqzsTbTMPQQvB4aTCqTPdfXk9PnA1Twj7C2DyO5rP6OrNxFh7dgflC@vger.kernel.org
X-Gm-Message-State: AOJu0YzFr1AytbD172ofQjEfP7DzYZIs7AoUcqd/QkZOlm7Y5AuTfix9
	CdLmzbN1gpIn6EPA6y38LOm1hiwD/1QyB5GhyQiC3WVyAmoae4SW
X-Google-Smtp-Source: AGHT+IEgQWxG/jK2xIQb6PtqxmurUXIWzZqkpeUYtDBWbVb+aFzPb2GKzoDMdSfjKGNFOdrQ9OLpXw==
X-Received: by 2002:a17:902:c94d:b0:20c:9d9e:9049 with SMTP id d9443c01a7336-2111af51015mr51252965ad.22.1730471650381;
        Fri, 01 Nov 2024 07:34:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057084casm22166485ad.92.2024.11.01.07.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:34:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 07:34:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mariel Tinaco <Mariel.Tinaco@analog.com>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] hwmon: (pmbus/ltc2978) add support for ltc7841
Message-ID: <1076fd25-b3cb-43d0-ad7d-4a0e365a9973@roeck-us.net>
References: <20241029013734.293024-1-Mariel.Tinaco@analog.com>
 <20241029013734.293024-4-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029013734.293024-4-Mariel.Tinaco@analog.com>

On Tue, Oct 29, 2024 at 09:37:34AM +0800, Mariel Tinaco wrote:
> Add support for LTC7841. The LTC7841 is a high performance
> PolyPhase® single output synchronous boost converter controller.
> Multiphase operation reduces input and output capacitor
> requirements and allows the use of smaller inductors than the
> single-phase equivalent.
> 
> The relevant registers in the LTC7841 are similar to the
> LTC7880, only reduced by some amount. So it's just a matter of adding
> the chip id. The device also doesn't support polling, on top of the
> reduced register set, so a separate case for setting the chip info is
> added.
> 
> Signed-off-by: Mariel Tinaco <Mariel.Tinaco@analog.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Waiting for dt approvals.

Thanks,
Guenter

