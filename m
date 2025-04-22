Return-Path: <linux-i2c+bounces-10522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75491A96CBB
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 15:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE78617A01A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 13:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE8228369C;
	Tue, 22 Apr 2025 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKyCoDN/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295B281367;
	Tue, 22 Apr 2025 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328340; cv=none; b=HoqvZuY4OlxGg7YCm3sOl3Z8lwm9zbwcsZRl+YGhrlf9qbUv9jRdLn4TbI7XZW3fIkYqPlBPueFPn3u9hbE8ZqmHDFV5cy94ap4WIpSWmgoC8UplUuKpTpq7js+lhHhYlOzQxN4S/PB2SB3s1EdqHdPMK4jYoRgGOpOp+pM4Qn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328340; c=relaxed/simple;
	bh=sIwen7WsPPQoT2R+raijeINXf73DVD6D+YM6rXvMk9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3PfQt9fj8tOFB8K/rZCOqSoTPX5kjD8sVn4rquLmMO5KYOneU+9YO5m/vmDGmasFPSN5dWUtnCiG9s/kFNDnPzxxMCDRUPzntDjFwvkSYbv3TBGUkVbrEm/VfB6i9N2Pub92Lx7k9iUN5dZVxPZUyXy3G7Wcvzf0mz+zb0//r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKyCoDN/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2241053582dso71492745ad.1;
        Tue, 22 Apr 2025 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745328338; x=1745933138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtV3DhJOKkxTU+wj+E4JlDxdRWyHpER3HDjZAA/FV7w=;
        b=IKyCoDN/IeeTKiGFOjyDcTekwRltrjOKEBMNHYACg23hJAwHWXn33/qNmAvRnaYjFK
         gpVk7OZDwu2M1PgV8G+UcSD3ITOUalTStVKaGg5cObjAB7Ih6d0QXqHTqNs0S1570td+
         V6BGK3ZcRdB3UJFyCPn7iPsrTBH2ebVj5dF6hdUuzg0ByZEZj4ZTVmGJa3lH01m3FPg3
         YtSjPX1KAfnBgTXAWl3feQK4RJRqmVE08qGxXgMUiJ+jMczbUEh6GlWmz8SgYfRlGQp6
         xI7fhzR6QyOo441xQ+Xdj4PZCHa7I1N+9KF/LOWQnuF16k9dccXXihEIzQRp9CQ4lCpc
         t2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328338; x=1745933138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtV3DhJOKkxTU+wj+E4JlDxdRWyHpER3HDjZAA/FV7w=;
        b=gq9lPkoa76OCfFaZmfAXW3fqp93d9khCRCHK0DOOyJc+mFIyZCH0qcjz4vzF9O3TMI
         7AVXNtqRdYGFO4+fx3yC5MgUaVU+wnAidZBlsGhe4OIBw4qmWibKxhoCE/6JOJHIiSNR
         9EIMoKd6jcoOhun8gFEnx1WNLf2c0CIK+uIYSva8XfRwOzIKS0XamihRpqKDyQoQp2Kk
         dd5Ms/Jj1dwtvyeqgReNb12xQ9uUHWNp9AHcqojVuE7uqCQT79DssnJJP+jRSwMC20aR
         Yzsr6pC4XamA+rD9JopA1h2+li5W2Rko8ivR3t60IFGv8p9Ku64YeJl/QjI4uXXDKYRV
         mhvA==
X-Forwarded-Encrypted: i=1; AJvYcCVMt+FKzO2EPVZq8DHmstkUSe//YpOpaOmMjMNWzlEWYOJORaDeT6gr8BSJNyDETVNMXDd8sbwZQA6P@vger.kernel.org, AJvYcCVmwZlZhW0RLNAt6wG69p3t937yNE8ryBbknDeJTjToT1srQvNiOpOjkeU82AdwSY5zaKIeqaoZnWDk@vger.kernel.org, AJvYcCWSynwR+ReBPuT/l5VdfwNjvR/9yQX+uQuNfrP7q9EULqurSZtTGTnqNnvvxw/zp7lUL5NfhFqJuChp@vger.kernel.org, AJvYcCXOKfj6NiwJCRMBlduskGYilkAjYr1XuUcogq/LugI0YtBdWS7LawcVEL7Cz74Ch5/a7dFx+z6EnfAe2gBE@vger.kernel.org, AJvYcCXv5+tIR9jSD5rtGFjwd2LOkvx5ABMq1OTHIzE/nmqyJyMIY2DXpmfYVodcrfIXLOrfpdZSaQSZ24OIoyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrI0QxXMH9hDDmIlijwK2WsjOh8G/mC+foXKOqOw7Puw/+qZ05
	IZpPrt+nVc1Dg0jzoJ1TojEipImXOMZuk63yoPy0K0YDJqQUnSDZ
X-Gm-Gg: ASbGncukDpFP9uukr+0Dd1cthoz/GgHmiRZ0C70lL715jQQPhWtcsa0L2CLSZGjhduL
	oR5MXpNXwLX/wNmdlPcpu3zRRwLOzfM6nY+qC6gdu3sQLn1Uru0Lrr1xGCmzGb7UA94+letTPvq
	YKNtt5VLxh5PQL+t801eRdzYCgARcFpRzYz9dD3r9566ik3ExPLY752+TZsVIghD4bdWqd4Jc8U
	44TpNahBy7JXlJqFQRA+FX7q+MMC4CZlEHtRDD3pyQXNOFqUXjIrB6zBSVPJyr7hHJIWQganJWH
	TO+F5B/WsMMBZ0WSRfJfPbxpM5MLeE2/OOIJciM2602qw0iCDC2kZ718173p+1En
X-Google-Smtp-Source: AGHT+IF788IeKgjdtqU+/vaSukLZXfULJRHLvzd/tFEY8O9tspAjkjBGc1I1/V+TOAmDpvF1epaJaA==
X-Received: by 2002:a17:902:d58b:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22c5360454cmr242767575ad.36.1745328337792;
        Tue, 22 Apr 2025 06:25:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf5929sm84380785ad.104.2025.04.22.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:25:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 22 Apr 2025 06:25:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/lt3074): add support for lt3074
Message-ID: <9ee5014d-7403-4eba-908f-8c1d10b102aa@roeck-us.net>
References: <20250421-upstream-lt3074-v3-0-71636322f9fe@analog.com>
 <20250421-upstream-lt3074-v3-2-71636322f9fe@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-upstream-lt3074-v3-2-71636322f9fe@analog.com>

On Mon, Apr 21, 2025 at 08:18:19PM +0800, Cedric Encarnacion wrote:
> Add hardware monitoring and regulator support for LT3074. The LT3074 is an
> ultrafast, ultralow noise 3A, 5.5V dropout linear regulator. The PMBus
> serial interface allows telemetry for input/output voltage, bias voltage,
> output current, and die temperature.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

Applied.

Thanks,
Guenter

