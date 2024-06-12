Return-Path: <linux-i2c+bounces-3990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DED905803
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 18:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E645E1C24642
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 16:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55CB181BA5;
	Wed, 12 Jun 2024 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhysItPc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E349181B94;
	Wed, 12 Jun 2024 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208000; cv=none; b=CFgpGflqTSKS8K2e/77izSYKaaxwbZjnOdZqI8x1teitgZONZoNrdqTBYv0lU3UtyxP06GI6BkWlIMyZMsiEm1zkstlfB2HkMp7s+p3xAlTaHoVjbWuStnQ6XnuKC4i82pID0/kfFrN/1dzLoANAq75MQotM+L5ti3WLHCtnM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208000; c=relaxed/simple;
	bh=MFTQFSTMi4rV7JVvv20Nll7zYhk4Ld07bVBA0xDpuzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEYl/e7xo1qicO0jxi113N2bUanIbtgsewDc0JuBVzFfUEiPuGvUDcTuMvrEArIMrhJoUfithXe1gcWBCzXzqvV4fxcUzIAjYoiWPLukNz8vuiTWuX9WIh80M6I7hsZztyNzZsJTP4lYNn4yATprlzWb10xKXIRSX96Y56DLKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhysItPc; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70436048c25so3450630b3a.0;
        Wed, 12 Jun 2024 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718207998; x=1718812798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8NgkNyVyNQwXFRwHqDeJKJK/3Leo9fCWb9muNQfPXI=;
        b=GhysItPcYSuX4d5Kk0Zqhuc3nfyj4J7n3otZ/mUrGMWHai9/l/VEow1mv1gGUkf9Xe
         gmnR7y5FMIwPvAZwLTwtjUozIe1eoXy6GSxg7OZ+/FCHcFJPCjQ2Y3YbLcm6FmCn6xcx
         dz9/K1VXrV5yTKfGHVWpBv+WX0AVnjdqrE40kC9wmakkLsRSgXqyOq5xYWSu3ypIbA0C
         J9d4OXVy6BlWtqzfem8VHsmgYvhQMH6JFhJITPSUMHIA6mpvXw6pfuPz2XnOdIgIwpcD
         HNBLjVD9d4btO2jyDaB1I3shu9sx363lfdm3W3yq2Y5eRC8zh9/C29xwqjw2V5It0lIT
         YtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207998; x=1718812798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8NgkNyVyNQwXFRwHqDeJKJK/3Leo9fCWb9muNQfPXI=;
        b=D8Ga9jMcCNe0OEmh6Ai0Pdt1GhNz2Mrp7x72l9yanLN4vHI3A/S7hiGx1k7cOyFvBX
         AtZCLbp64k5O9bN5FRJcq6/g5dUVR8pXcZb1djGOd1rDm0zF/gpo2t1+zgYQwp2rzaKY
         KKqWYkkCFegPcYYaiSZhj/X8ZILE5Vg80vK3Y0/7uo5Rvbn3OsP/xW+cgtMw1XF9AQ8P
         j4+jxQ9fADdT7wyRNxDQAYe143pt2yqWz8daymyEClxgjOFhCzsFg9vcipTTJ7gw9zjy
         Sn8uB1U6IHLxiFP71niiJsZqju59j5bhM/hAhIStEQmZN6rb6d9Cztf1F/5pbRQh8AoO
         21iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBOD28p3HM9/WSA0i2h+BXDS1KiWnW/DmUisSaAfac+tsJtIPDS94DOyPRapBI8mkt8kmyPw+UaeAlR5hYLpbgZd4D5A0MKfcH7YO4I49fvfRA3wpPCUND70UiuAi201rYgSe6DA4Rx4N2Sq6oVwJYfFuXAN0xs6g2YOPXkrkF1+NFRdycTBI4Fbf7eHvH1OQ352/bNNIO2V7UTZMZ3IKRTRx0fvRLaVgtfPVV8mQAXwGDt0IJBGUvOvY5
X-Gm-Message-State: AOJu0YyzD5KqMpPYmyczvwnzIty9ecQ1mVjGQqV/phZK03aA4cXUHsrG
	7iqtdIQ9NdGCIG8jKbGp8qP7ipI9srt0Qtzdl61GqV9GLhEew6kS
X-Google-Smtp-Source: AGHT+IF8MQ0unt84OWjBFQ75s4vpfFr2BnoSGg6k9Qdjigtg64ny/tX5e4psyLIn9QYjbeIpuBqbXA==
X-Received: by 2002:a17:90a:6006:b0:2c2:c74d:303 with SMTP id 98e67ed59e1d1-2c4a76f840cmr2165804a91.48.1718207998502;
        Wed, 12 Jun 2024 08:59:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75d207dsm1967650a91.12.2024.06.12.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:59:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Jun 2024 08:59:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
	peteryin.openbmc@gmail.com, javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com, bhelgaas@google.com, lukas@wunner.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: add MP2993 driver
Message-ID: <65ee7786-2adb-4d25-b5b2-5938dfea0e86@roeck-us.net>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240611101417.76911-1-noahwang.wang@outlook.com>
 <SEYPR04MB648203DC017A514837DB1204FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB648203DC017A514837DB1204FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Tue, Jun 11, 2024 at 06:14:15PM +0800, Noah Wang wrote:
> Add support for MPS VR controller mp2993. This driver exposes
> telemetry and limits value readings and writtings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>

Applied.

Thanks,
Guenter

