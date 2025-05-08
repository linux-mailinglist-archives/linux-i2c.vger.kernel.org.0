Return-Path: <linux-i2c+bounces-10904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 660EDAB02F1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 20:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C593188EF23
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F197286D70;
	Thu,  8 May 2025 18:36:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D532147F6;
	Thu,  8 May 2025 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729379; cv=none; b=BSNf96XCdhrkWc6KLEm4Z4t2p2/N8GPGXgwBbeCEQTY7ms5e3f4NonK+Ce+rt/PYxjF15x/QlZm8uG1ZVxzy0RR+3iuSzhGYLXq88YAtNItG7oNgECGI/LJO97JirkqXsZgD9RFsa4L2itd5rUZjbRCJR2Z45SqErDNL5pFMpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729379; c=relaxed/simple;
	bh=8qRcaObsbkV3dzahO6i44klrpzR4rTo+K2qGz94TNdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1u72GvS9FqRptZoKishEwzcKcekS/xZ92DboaPjjFAycqeyqwStIkatUrKcytlogp+2oHOGBRnkZtpEV403sQ4siogH9h3M9B9oVWpCeojXMbSdP3bNuACYEaLt6cGW9D00tOJagErTfv/O2EtU/rKOuLGOuiDKIkY3sNocvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso927178e0c.3;
        Thu, 08 May 2025 11:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729374; x=1747334174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYgnp2PSg9KL11tldQ485cPxrLluqoPttc4PhTteUa8=;
        b=EqhULSwtmOi6cmc6eJEuRD2wT4jS5gLsS1cAuCoxWNmPJOBSpZylt3zF/cjB/bKXzX
         GVShia+9u/YVQx+0wI1LIDl+9Q8wFqDTzJ9knyCXW8NfKTMwtAaypJo6gxwe+O+DRbGn
         rs7O+cIIA75eZjuw8cH4FC/dwe1+5UCF9WQ3RGKjKQc4B4ETbi8y4c4RVgB2uZK8tnIy
         pK1MJzxOhjm0istfv25Qt7ay0hyjdyFczuMaSjNQf6LMprZbxTMEZLMuOws2/hkK4tEk
         bDHw/CFneUZ//jVAeCc6oSegl8tDyuOF1w42XX0xIR9SvGeN/CMguJU4IpZf9pR9Limf
         Tibw==
X-Forwarded-Encrypted: i=1; AJvYcCUc7KWKmbUyMasqCjC/3Um1Eqtb9/wjWadBnkDmtEKJKGV4NI/eRt3urSFmg1VB9/H3o0s+h1g26NIr@vger.kernel.org, AJvYcCV0WzF+i265RUUa/SLqvulImYUfQMFwLwf1m3oTISi0YltqlftxW5XLKEgt/V3QJpnKdGyephn0Zjxl@vger.kernel.org, AJvYcCVBloFIEWg0VwWBtIgLblndzyRnNQC1MO7ckJlCvU3tluUItBQExpoPIm8cqn4XHQoPK/Pj5lhxDoor@vger.kernel.org, AJvYcCVl2gNq3jgFeyYe53ZjU/T34hhcKve6nKltKyuxk9MYedBoKi5IYPsBaLpDoy3UPLrYVt2dakHTIS1/iNDx@vger.kernel.org, AJvYcCVrvqxh+3v61QD10PcG67ERKfi3dMiVh1Jime2CekZa3ZDk3K5VknQJlGSIdSoBujQdWNoR0/DfzYsl@vger.kernel.org, AJvYcCVw4SWOBXFsdjAVjAhv7+JiybMDGliIiaWV+2OM0bwnAG8tYs/4+Mm0hqwJ+AKSVPcN+WtB2ae50PyQ@vger.kernel.org, AJvYcCX8mVYJeUtvs/AsSFYe6x/MQwkZ8P/9g0L4nkYzCvVgxGKCNCh1wM3kKOohH5HjUQbjGeaZRUQRKJsSpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6RThLFPgjHH79alBAZzswAhX5RKxudQwnM/XSUUkTqHSOUYSR
	FP56XSX3FYBYpiPgjmlKPcORFaTOUzKOTPSu7M/sj4SvYX0m4Us4nQYkh/GQ
X-Gm-Gg: ASbGncvlxqmy8l1s8zxVlsAY2rFJg6pP4v0WYUm+8I7/+XRCusSuoc+XHzx7p+8zaeQ
	CVcamU7KimTCzvNlgTUhU1p7P11p135rQxKiAJQyyiPlnoCVfP6ETeGQ2AxhUuXEmK+FaRWOACC
	njQyKiIlHlE36V4IM1cTkosI+lFM8yS587WgTwlT6YIrJt5cUxtxqrPK6oGwBpkZxmKXNEseRvv
	pd9W346A6i5wZeF0nO3PNK6gSuGAVKs6ieRVoe4gjuSpZ3xH7VqOvyjYB12XTOWWuiWg2r/Ws1J
	NzdCisqa6I2w4HBbz9HDLvmPpLo2MlfagpKz5a31fOeGXkcErHDdTZeZIEPv8gKs4lLccn/c/9z
	uKllc0sg=
X-Google-Smtp-Source: AGHT+IEwjchnCI5bdbWFc8ap/iPnG+SrSIGfn53ZONiLXepF5XDNn+n3PxnLIEI+tAyD7o392jTrZw==
X-Received: by 2002:a05:6102:15a0:b0:4c3:2803:61c1 with SMTP id ada2fe7eead31-4deed3d38damr497871137.18.1746729374058;
        Thu, 08 May 2025 11:36:14 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea857f6a0sm189390137.5.2025.05.08.11.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:36:12 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52934f4fb23so880416e0c.1;
        Thu, 08 May 2025 11:36:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU73vWYG3iqWtTi3oK3FnK6kufkREXCN8vYx52UJeoQwCGxlMNNyATPaMwJU59EPnOR6Owv7OOtin5y@vger.kernel.org, AJvYcCUm3em46o+5cTi0BvSEts9tRy5s3rmENp9dezBVQhwYj6zK0BOGniYLz8H2PTYRJux1xhbIoGBpAzqP@vger.kernel.org, AJvYcCV1tCRAo2F+oIkoHfopg7D6MG0nkdd4A44oqJzZtViEkosSbjA1EjsAE274jeU11BWGGdD7oWsc8URNl431@vger.kernel.org, AJvYcCVm6pG16bEejVZYgVJx98y76O782G/yN4vj1lk2bLpsnncP4GKQ0NKLhxz/Qos1RLTRMoFIf/dv0sSR@vger.kernel.org, AJvYcCWqrLmrbyjENk7xZsMmaf32usvMMgbsxPcZxinT4k45gixQoj9W715jvvkVa7p39cNmbaEEFAcKe0p1Ew==@vger.kernel.org, AJvYcCXBPKC2blKFQK2E+Kh33IjAw6ogEMzhXXDpJF8Wz1uUxwdXyVV8YmXUo7aT08albsDZyKjQIYtBfnoK@vger.kernel.org, AJvYcCXIbNn+1HARPp+U7gLgrSdyAh1N2UNQ7wNwexOUj84erM8ZBTk7Cf7smr1abidjiqOlFjVHkYb/Rvvx@vger.kernel.org
X-Received: by 2002:a67:e7cc:0:b0:4dd:b037:d23d with SMTP id
 ada2fe7eead31-4deed36f9ddmr542907137.12.1746729371961; Thu, 08 May 2025
 11:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-13-herve.codina@bootlin.com> <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
In-Reply-To: <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 20:35:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe9XKDvszbkz9jx=qcyLufFMnoG3BcTpbyay6cQZAJ0A@mail.gmail.com>
X-Gm-Features: AX0GCFvrzDOY8sW8kwNxuZ1_3pAgsil5zL802IfBcD5409O6It8refjLWt5eRkA
Message-ID: <CAMuHMdWe9XKDvszbkz9jx=qcyLufFMnoG3BcTpbyay6cQZAJ0A@mail.gmail.com>
Subject: Re: [PATCH v2 12/26] PCI: of: Set fwnode device of newly created PCI
 device nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 20:32, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, May 07, 2025 at 09:12:54AM +0200, Herve Codina wrote:
> > Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> > node are created and filled based on PCI core information but the
> > fwnode device field is not set.
> >
> > When later an overlay is applied, this consuses fw_devlink. Indeed,
>
> consuses?

confuses

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

