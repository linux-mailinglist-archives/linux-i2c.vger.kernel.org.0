Return-Path: <linux-i2c+bounces-2570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5551F88790D
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 15:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9711F21BCB
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 14:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08874085E;
	Sat, 23 Mar 2024 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDYfbwsg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C552AD1A;
	Sat, 23 Mar 2024 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711203673; cv=none; b=sXfogq3zIcrxfbxUBv+42jYIXBGiiw3xWldnFlj9Sd+Gd3QDTLkHASsVICA3JXlnf/LtxoJfeaL+lKJpiEY8qJIRPHm5L5aFdRKrgsjzUmomXvPftBgUjdXjYCZdN7772pJoqomph72f6GyPcCOk+g9q+nlYcoI6H8xvZ3iBX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711203673; c=relaxed/simple;
	bh=LQSM7yKhUlOQk85flm8Fe9F1E4PUvVnlh+Dz78622r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti+QYMvyX85iVI73/3NhHECfJ8zt4Cn+kGTTkT2aLk9xR2n2Cfd1HDX3aZLegKiaf8vNfD80d/YetJF0IOPbjG2mGR0/GlVO2nr2YFjo+9K2MGv7xvaQyBKM/Up+vwzRLOWx2jJPM6eCiz8ZSMQz5ae0R/BE7UZZXkJFvknCjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDYfbwsg; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-366a4bcb2a8so14261125ab.3;
        Sat, 23 Mar 2024 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711203671; x=1711808471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RHXM9mG48Bs/22v7l3z5kWBGbxkBAHgIQXpP0ZgZIM=;
        b=cDYfbwsgM3K+UfwT268jvHLNnofC/AtU0lKzwj2nWeq3jk9thmG5ktw0AvSlLVQ9vl
         hnObjGsLqwSLXQ/R0sdDDcLzV+VN9V+BAC8iuGf81lYuDW4m6/aZRJPIUoE5dUBtkCl9
         Qa6Nq3mWNMZtAWZYrDi3j6gOV5Kml9Ix7DkgsaU43+mxSHnyLiaEPPY2sEeVIKnSCJ2G
         c2CRiJCwSWi792ywmeywhDq40X71G8++lRzfi8cBWZhPbxeoU6tzIe92k4sFlPGmv43d
         xBVAtFl5zExYh7p55fbEsak4zk7Vv/MdCz7flzB6dK7dyj6EWO5QrvNa3NUDNmGPsWT8
         K9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711203671; x=1711808471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RHXM9mG48Bs/22v7l3z5kWBGbxkBAHgIQXpP0ZgZIM=;
        b=NKWs+piPW1DL+edy+rhfBNngMjuiU9+poWpKNF41Hwguo0dAZtLPJLUPk9gT4Ad0Bo
         GTO11pFkwtZkbk2BZN/xAOBPuqk2fwLsu9bg6HtwGPaI5c2R1iEbbN/+cozTR/1K5x0D
         MAE8DkHL/l1uUJKkUFEiEsKfMdHtYAdTu0Ok6jwIMMmYnSKLJ7ZjqLZhd0ovIqAmu5tH
         QjHow/UZB6KlVo+QDA8VJ3yrCRpj3CggPuv/enPGwV+kW7Nfc7eGLQADmDcxw+Kxi3qs
         dnPi50mcoCD135JcEL+SeRT4IzwTYV1vCJZ0dfwBJpDoP7bNbSPfPHsxIyQ92fbsb2/y
         2YvA==
X-Forwarded-Encrypted: i=1; AJvYcCXf7hSQhlPasNj1fpIkH67p201fdBil6b2/3XDk/3TBygCCmycS2nKdw7ln4zOopYHTaATW1qouTGjD/cScZ0x88+nNzXxyFkJJwZoKwHpvZjlClPUEstkWBxQX7MSUkXXh5v4320JtffeWrk4Zrhb4NUcA48Qxo7iJ403v96RbbHnjcETk1Oks1z7GpF9gmNoUHgHpl6rsPu5WLRC8b+n76iNEMvTtkFQ48Do/nnA/w4fKHZP69N/wZwu2
X-Gm-Message-State: AOJu0YwoTOOwEyrg6XbI9W28IXU8sPOAh4QQ4soHyXzldgtl5fptPVoM
	7DbHRJQbVMeCqnht7RGJJUDlNCEc2QLprxMH8H5/Awkx+SFept2s
X-Google-Smtp-Source: AGHT+IGieyMNvkHptTNnBXY0vmfynM/4kqD++PFKUn1PsQP6D4hnpbLYIB/4XTAvfD3Ocv6HP44nNg==
X-Received: by 2002:a92:c6ca:0:b0:366:43bd:f0f5 with SMTP id v10-20020a92c6ca000000b0036643bdf0f5mr2611079ilm.17.1711203671333;
        Sat, 23 Mar 2024 07:21:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d12-20020a631d4c000000b005dcaa45d87esm3203575pgm.42.2024.03.23.07.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:21:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 23 Mar 2024 07:21:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Radu Sabau <radu.sabau@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: pmbus: adp1050: Add driver support
Message-ID: <884ad5e7-3cac-4589-a509-a7bb63545824@roeck-us.net>
References: <20240321142201.10330-1-radu.sabau@analog.com>
 <20240321142201.10330-2-radu.sabau@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321142201.10330-2-radu.sabau@analog.com>

On Thu, Mar 21, 2024 at 04:21:43PM +0200, Radu Sabau wrote:
> Add support for ADP1050 Digital Controller for Isolated Power Supplies
> with PMBus interface Voltage, Current and Temperature Monitor.
> 
> The ADP1050 implements several features to enable a robust
> system of parallel and redundant operation for customers who
> require high availability. The device can measure voltage,
> current and temperature that can be used in different
> techniques to identify and safely shut down an erroneous
> power supply in parallel operation mode.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>

Applied to hwmon-next.

Please note that the branch will be pushed after the commit window closed.

Thanks,
Guenter

