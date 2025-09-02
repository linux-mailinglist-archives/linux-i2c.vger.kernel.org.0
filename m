Return-Path: <linux-i2c+bounces-12561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C5B40B46
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 18:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C93121A808BD
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 16:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C6E338F53;
	Tue,  2 Sep 2025 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGOJOvCh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0631B131;
	Tue,  2 Sep 2025 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756832191; cv=none; b=FkWcNlSDt49RtmZVul1wdX1IdVTa+3OQmozhhodb4SVvXEXPyaz2In01ypVxF1yF+UXX0HU8Ww39cn5VIUDiJs+a1xQWdPqN6//59rXe8/z0YsyNnvBhC84mWxghV1kJIoNcpwCCfrlLRQ7UiTzPaYAZcBcd0LTvdKpJ4uT4DPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756832191; c=relaxed/simple;
	bh=XZhOST3in1Xh8ve1QrJxOqFAH9pi0OKKxLTZu+yY+Q0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Mz+dJZH3DroCB/lWEKKPK3XpC7r1Ge6IiT7LxI0PQI4gFbSUO0w7dUutAqt9VGQ/WD9d+rlp/7/aXJ1a9lmYt4rNAW7PEKOBLfEKuYhiDdPsEuukuu7kzNgDsOgseLHxmYeNrrLgyJpQStK5f3eTghExJcyPaRgo0ZcqNNuK1BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGOJOvCh; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b109c59dc9so67819611cf.3;
        Tue, 02 Sep 2025 09:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756832189; x=1757436989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XZhOST3in1Xh8ve1QrJxOqFAH9pi0OKKxLTZu+yY+Q0=;
        b=jGOJOvChzDRp6jagAoMqRYagnu/RywuYGjYiCIs9orfBeoxwgrm9VGfqmIFKeZXRmN
         is9Q6WSjhUR24Mc8JtZcis9M/i5G6kDfdtkKffgwjn8nL4wVdmUFrYBrFEk4bWwI3zli
         8Zozgs1bbe01/zzmvda3DkaeAC0CGgPc3iPJ1hnf3ZoaXdOZnfoG03Z4l/xh4IwkHQAF
         VBoz5M82lU9jARSRbFNk1m+uRuXF0sWEhB435sd53yoQJ6p9Kg69dg+SKvZTFTlehRTj
         7+29QRQdBcx7qB6LOOslIdsiaW/C/TB5aTseRY7kGqHBZRr+TBK2uH2IDF1Pc+KDN7Wq
         /3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756832189; x=1757436989;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZhOST3in1Xh8ve1QrJxOqFAH9pi0OKKxLTZu+yY+Q0=;
        b=lH/e5HICYEkEdQpXqYmW05vJJhKk2Zl03qBgrVF3grBYwijmKa8KpJj/20w7KmXDfP
         d3Xtrh1Npj92ylOKu7BmXO6ZqKlUw8F0lsEUDu0B37fHvZ5BuycC542RmqQ84BmbBwhy
         HoWamVi7tybXe6JvZUlb/kNA3kfK38nhirj266994M+irRTGmks6q6a4xZ5YfsKWHnTH
         LruPeFd8KqadyXgmDzUTXewMwGeNjopGGMgVHZbmW+f/oDf3EAZL//z834QPnrVoD2dT
         ZQ1kuktv2Yg/i4zoyRI/vKGTWDABugIP275KTVkB1278ZImpM2F25AO9dZb0LPaGzuru
         P+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJtgsXNUHuvWvXmeAlfJenyI06SEw7abmmROQR31CLkxse1nyY6QArSjTrSmJnHmX1DsMvI7ndek9r@vger.kernel.org, AJvYcCVTYsR9bg0kQ3rNMVIYRZIK5RH35Qqm0TlE6uphkNZMIah4fFrTM/W0Q59RjESAO8WfRYEzX6ZWiFIKdPpd@vger.kernel.org, AJvYcCX1xxjFAgu2dy4tnkBVShsIKP5BeH0BZXKHciyqFLrdfOXbh8wbjc2pyUU0NgY+6b4Iss+rwvjEmjh1@vger.kernel.org
X-Gm-Message-State: AOJu0YyANjOs+2+LKjXil76I+arg57pB0jfvgMy6UaK1mpWUqjA6h7ct
	i+zNtMWZy7jkxOe7h/WFYP/Kewkp++0xqmtyPZq+wq82TVDmpZP6tFzkU+piXJtz
X-Gm-Gg: ASbGncva+6zUXDDXlMvuqa0627b3JAXhmopVoppwHPiDgccj5LrowxZnrpWqeEom+dN
	9BM0WhLGT2YN0XIW9ZakaPMjjcX4zu1QAcxI85vHG9khiZOOqmGF0WHiWFJDGFUoF1IFwemyitP
	CGx6rQxllwd7OAkYjRpsUKV0LY7JlXW4gTwz+LZ9bXalpJOZAJftRcARTvG4DWMUhjIR3vMD/UM
	v87IfToQ3MhIUan7vk93LfD6dSZtAwXHwByaO7sAOCZCBvBwpivqypDrJlJ2qmyMf6He3rqPy4q
	rjFLQ+dafix83V/6KZRSkPHZk4iMQIjeRG6PxDC5RUbf2Fj6QyCUxkA3ez9InjKkEu/brCKwfsQ
	YIb0PfgcR4o9flCrObWqVm0Psw+/jfCx9107+VLmCGzSAAh80XtxPVeIvIg0eLwUmS5LrBhd8Ml
	rtPxL2NQ==
X-Google-Smtp-Source: AGHT+IH454t1AZPaP8m+LXjREsgeHmzav/1L3lvMSqVzetI6UcC5vxu8zTEuLQ4bG13xXnbRUnZQGg==
X-Received: by 2002:a05:622a:d4:b0:4b3:e973:272f with SMTP id d75a77b69052e-4b3e9732bd7mr13178961cf.5.1756832188688;
        Tue, 02 Sep 2025 09:56:28 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b3462c7676sm14790891cf.33.2025.09.02.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:56:28 -0700 (PDT)
Date: Tue, 02 Sep 2025 12:56:25 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: core: Use fwnode_for_each_child_node_scoped()
User-Agent: Thunderbird for Android
In-Reply-To: <aLa8lGxHvCd6nreg@smile.fi.intel.com>
References: <20250901163648.82034-1-jefflessard3@gmail.com> <20250901163648.82034-3-jefflessard3@gmail.com> <aLa8lGxHvCd6nreg@smile.fi.intel.com>
Message-ID: <AB7B668E-107D-43E6-A9F7-57F5F9FADD2A@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 2 septembre 2025 05 h 44 min 52 s HAE, Andy Shevchenko <andriy=2Eshevche=
nko@linux=2Eintel=2Ecom> a =C3=A9crit=C2=A0:
>On Mon, Sep 01, 2025 at 12:36:45PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Replace the manual __free(fwnode_handle) iterator declaration with the
>> new scoped iterator macro for cleaner, less error-prone code=2E
>>=20
>> This eliminates the need for explicit iterator variable declaration wit=
h
>> the cleanup attribute, making the code more consistent with other scope=
d
>> iterator usage patterns in the kernel=2E
>
>Reviewed-by: Andy Shevchenko <andriy=2Eshevchenko@linux=2Eintel=2Ecom>
>

Acknowledged with thanks=2E Will add this tag in the next submission=2E

