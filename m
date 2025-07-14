Return-Path: <linux-i2c+bounces-11935-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04092B046CD
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 19:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A68103BA013
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 17:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B205526772A;
	Mon, 14 Jul 2025 17:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8E9Iw0l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CEC2673BB;
	Mon, 14 Jul 2025 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752515076; cv=none; b=jWaCgKVFVGLas7bJjxWtRB492KdEECiEUy2fOXue5Mh9q2t85qRyYkkzo5fOoxHj2EMsIcyvAJMVyf5W7ohMfWZ5olUJJTpqcREEwb4BhvDRav7XwJKBDqfuzu4U+kl03IAH+engIYi08gka6AAoBvGZcTHLcknTX5ul+x1Qu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752515076; c=relaxed/simple;
	bh=FpIs8x3wOR4QDIl4rTH8WQCJsw8SVEQKjwt/hRvJVYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhDd+fZUabliKfGWJdeU3PMjNH5l0xT9gICLA8tSJDOwm5DpSUzzcPck8oFUbsXlIGvl4obSClegWwKyxjJfOYspky0u0IQehuBYo4CDKBQiirkhP2v2V8Kbx6ezwf4Ei6pCN+kHRexiS62Xs86eNhvlDp1C54w9AowHaAHa2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8E9Iw0l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6880C116B1;
	Mon, 14 Jul 2025 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752515075;
	bh=FpIs8x3wOR4QDIl4rTH8WQCJsw8SVEQKjwt/hRvJVYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f8E9Iw0l1s3u4GUjtdigSpqe/0ME79OcCpJcopd+wcAm9W0iNGsHck2mRJKvqniJU
	 cHL/+J4GYfwo7kkhEyKN+v82iEB05WpiZGbxMJZe3upnKFvtJxg6ER+J2rZ8Ljro7b
	 HtlpKYIYp9AWyrd/hfP9TVfKZWJYS5uxWNgZ1d8Kf7g/suwYj0nle35JgGzKXFYUtk
	 Xlika5iSvll0Z7lJGVjJd1uo3U4nim87L9hE1vH3YfcYIJ9Hn5fYLployw/rK7mYgl
	 U7mAeuxWv7hPy5CfhW0ewERIQB281YFPfoMx8oomGNXvqLpyNor3Loid2VwjgkU6SR
	 JsnHYrciiFveA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0dad3a179so778957466b.1;
        Mon, 14 Jul 2025 10:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa3zdscG65kalu/1IepT0ifG3g+OvDyPIRPlV87cK+j3r1RK1vxYeqxeF8OteUYjEqKWBG7pv5WWsA@vger.kernel.org, AJvYcCV62ys/0XXl/4oIpfBaojjnIlYfq4PiTp7Lp0cBD0zka4xmD5EtaaAlJH180cMsMJEoKs6EK/iArDoK@vger.kernel.org, AJvYcCVOs8qkJPs+Csq9JAzawHHq27z2pYWPf92w55NnLaEAxGJDgamUuK7vvli0roKQOzOiRTNVOKjqaxA7@vger.kernel.org, AJvYcCVz5sfqK59RjHFvAagb16SlWM+/YpxZS6deUeDJT812shl3dKA5dd7A91YKlvTwMe6ZsKjkoIfkLTBWCg==@vger.kernel.org, AJvYcCW1tOQLGA4Kf3Yde7kXlLjupNBkksqmi7csa1nADCaa89L48xyNic7aTKrLJTAqNFBzJHhbLXOcaNHU@vger.kernel.org, AJvYcCW9+lCpYnAnL3be6MVypP6KAD8+JOkIMZDUVSKZniRixy4/mC8aaBcGHfBQtVSKcm/ee/5v9Hd8VFIRsWht@vger.kernel.org, AJvYcCWPcPujx1gNqSgOgrv+w7Xll+DIHVFylcUp5OYHVz8MgnH5vaAnNFBu3gc6CKrhCmeNjSyPmU4aEK62@vger.kernel.org, AJvYcCWakOZcvcIc3q4LoYGfe+4xFq+78Ob7CQNyEPjI5XKCNYR2MFruK5lixE6+rigpvfG0rmPw2EWPI7wG@vger.kernel.org
X-Gm-Message-State: AOJu0YxIYZJ1o28VZ3wrJOdmMD9aRFV9nfHsUP+/xzDIO4MbRZFNdryA
	IL/qPE9BRN3wpbsQRuhB5qh6wZUNs2lN+jvYDDz9Yj9zKav7jmCNaBiVWWmqOUtKmXK3ASH3VaF
	jU1GUVwW1EUI5frT5JrVdRHx2u2DMwQ==
X-Google-Smtp-Source: AGHT+IEGQ7nHD+/xyba/tE0S2QjAjkVhfLJ9Pp8nFl2aw5w2DKZ8hhnS6UxFCO7dT9w+GWuozWbDzLrfoixjq31W73I=
X-Received: by 2002:a17:907:3c8e:b0:ae3:a3f7:ad8e with SMTP id
 a640c23a62f3a-ae6fbdec31emr1398694666b.25.1752515074068; Mon, 14 Jul 2025
 10:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-6-herve.codina@bootlin.com> <20250627155200.GB3234475-robh@kernel.org>
 <20250703093302.4f7743ea@bootlin.com> <20250704105725.50cb72b9@bootlin.com>
In-Reply-To: <20250704105725.50cb72b9@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Jul 2025 12:44:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLnPxUKXo3+Qdv-C1kXa6zbL1zMKDQsg1--08EY4TwsKw@mail.gmail.com>
X-Gm-Features: Ac12FXxDLTYP2NvcYJSixLW6cmzqJDujemRg676_boOWrjf2yfM7xtUL9oD9OWo
Message-ID: <CAL_JsqLnPxUKXo3+Qdv-C1kXa6zbL1zMKDQsg1--08EY4TwsKw@mail.gmail.com>
Subject: Re: [PATCH v3 05/28] bus: simple-pm-bus: Populate child nodes at probe
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Davidlohr Bueso <dave@stgolabs.net>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 3:57=E2=80=AFAM Herve Codina <herve.codina@bootlin.c=
om> wrote:
>
> Hi Rob,
>
> On Thu, 3 Jul 2025 09:33:02 +0200
> Herve Codina <herve.codina@bootlin.com> wrote:
>
> > Hi Rob,
> >
> > On Fri, 27 Jun 2025 10:52:00 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >
> > > On Fri, Jun 13, 2025 at 03:47:45PM +0200, Herve Codina wrote:
> > > > The simple-pm-bus driver handles several simple busses. When it is =
used
> > > > with busses other than a compatible "simple-pm-bus", it doesn't pop=
ulate
> > > > its child devices during its probe.
> > > >
> > > > This confuses fw_devlink and results in wrong or missing devlinks.
> > > >
> > > > Once a driver is bound to a device and the probe() has been called,
> > > > device_links_driver_bound() is called.
> > > >
> > > > This function performs operation based on the following assumption:
> > > >     If a child firmware node of the bound device is not added as a
> > > >     device, it will never be added.
> > > >
> > > > Among operations done on fw_devlinks of those "never be added" devi=
ces,
> > > > device_links_driver_bound() changes their supplier.
> > > >
> > > > With devices attached to a simple-bus compatible device, this chang=
e
> > > > leads to wrong devlinks where supplier of devices points to the dev=
ice
> > > > parent (i.e. simple-bus compatible device) instead of the device it=
self
> > > > (i.e. simple-bus child).
> > > >
> > > > When the device attached to the simple-bus is removed, because devl=
inks
> > > > are not correct, its consumers are not removed first.
> > > >
> > > > In order to have correct devlinks created, make the simple-pm-bus d=
river
> > > > compliant with the devlink assumption and create its child devices
> > > > during its probe.
> > >
> > > IIRC, skipping child nodes was because there were problems with
> > > letting the driver handle 'simple-bus'. How does this avoid that now?
> >
> > I don't know about the specific issues related to those problems. Do yo=
u
> > have some pointers about them?
> >
> > >
> > > The root of_platform_populate() that created the simple-bus device th=
at
> > > gets us to the probe here will continue descending into child nodes.
> > > Meanwhile, the probe here is also descending into those same child
> > > nodes. Best case, that's just redundant. Worst case, won't you still
> > > have the same problem if the first of_platform_populate() creates the
> > > devices first?
> > >
> >
> > Maybe we could simply avoid of_platform_populate() to be recursive when=
 a
> > device populate by of_platform_populate() is one of devices handled by
> > the simple-bus driver and let the simple-bus driver do the job.
> >
> > of_platform_populate will handle the first level. It will populate chil=
dren
> > of the node given to of_platform_populate() and the children of those
> > children will be populate by the simple-bus driver.
> >
> > I could try a modification in that way. Do you think it could be a corr=
ect
> > solution?
> >
>
> I have started to look at this solution and it's going to be more complex
> than than I thought.
>
> Many MFD drivers uses a compatible of this kind (the same exist for bus
> driver with "simple-bus"):
>   compatible =3D "foo,bar", "simple-mfd";
>
> Usually the last compatible string ("simple-mfd" here) is a last fallback
> and the first string is the more specific one.
>
> In the problematic case, "foo,bar" has a specific driver and the driver
> performs some operations at probe() but doesn't call of_platform_populate=
()
> and relies on the core to do the device creations (recursively) based on
> the "simple,mfd" string present in the compatible property.
>
> Some other calls of_platform_populate() in they probe (which I think is
> correct) and in that case, the child device creation can be done at two
> location: specific driver probe() and core.
>
> You pointed out that the core could create devices before the specific
> driver is probed. In that case, some of existing drivers calling
> of_platform_populate() are going to have issues.
>
> I can try to modify existing MFD and bus drivers (compatible fallback to
> simple-mfd, simple-bus, ...) in order to have them call of_platform_popul=
ate()
> in they probe() and after all problematic drivers are converted, the
> recursive creation of devices done in the core could be removed.

The problem is how does a bus driver know if there is a specific MFD
driver or not? It doesn't. The MFD driver could be a module and loaded
any time later. We'd really need some sort of unbind the generic
driver and re-bind to a more specific driver when and if that driver
appears. We could perhaps have a list of devices with a driver because
in theory that should be a short list as the (broken) promise of
simple-mfd is the child nodes have no dependency on the parent node
which implies the parent doesn't have a driver. The specific
compatible is there in case that assumption turns out wrong.

Rob

