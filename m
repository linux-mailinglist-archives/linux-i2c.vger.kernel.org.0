Return-Path: <linux-i2c+bounces-1140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB1E825315
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 12:46:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB2B1F23C72
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 11:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E602C6AC;
	Fri,  5 Jan 2024 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMZmUuqU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B852C868;
	Fri,  5 Jan 2024 11:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cc92a83200so509512241.3;
        Fri, 05 Jan 2024 03:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704455149; x=1705059949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0rqPpian/jfdGXSU6mCdzeSDBwql/8GDCFchvecdYuc=;
        b=jMZmUuqUWP8VIyap9y+KyHo1eyu9LNHC9KPRjhWAsYpyvfQw7hDxcW2n7X+LGhtuuB
         kDko3PgN7N+6AAcMVotiKx4IlSKmQNyb3lig85Jl8XSvmOYAiDPS0qVHbcvsHfpt6fhj
         CwK9UTNO9wM3wWLhULKB8SVU9PypISM8EIXVY13WCpwkniysFEGdyF7KJtlvzv5goFOM
         x0qLL5ySFhE3mPnH0bdttIn+QQ28bDYsjgoA8m2MFcgljWJ28TDIY++96lbHYc2wftZc
         1QLxBqb7aJV0lFLXQsGO+MXULoHSgYbsUU2zfessq60Buv0jBySmjhUviP/W8HbSkDys
         Gl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704455149; x=1705059949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rqPpian/jfdGXSU6mCdzeSDBwql/8GDCFchvecdYuc=;
        b=HAwhh4+yUpvdsEFuvEiMi65JcQwedR7HkQv5gq5CdQR62JXAJs2SxtIZQrWi4+kYOc
         SNvWYVEKDZiQyZoZb0gr5lvHy2qg4NSzRT97Om7fg0/RAHFQpo2tm4AdKys+HwQnadJK
         kkEqUWnv/yZEmnnri4tXYBJUS/nd9woTzkeBw1C15t9j5/IJxlEp6TfzbiwG9mh5GVRB
         4Bau4F9x9Q6r0s6smEW0DsmDG1a06OvXkoU3e7/06xJx9rMxNhM4k/6oUBTf4u78aUU3
         VRmSfYYlw9PbIPZCCMxVKrfUR9ab8eie90n8TY+Wp9zcmfRu2m5H7yLz+IFOpScQM/Sz
         8MCg==
X-Gm-Message-State: AOJu0Yxv/1zn5Xenm4Xklq8ixE0xJIjdzxxUlPNWxsToojQvCezbt4yI
	Ys/IT0A1V/JkRRrJRRjqu9oYkcG3gNCtrDmuIRdhLZpTyDBp8w==
X-Google-Smtp-Source: AGHT+IH3/xDIdQqMbwEsjtziKjIGTTruDhlUAT177kpxKXNWlGNr/29cpaVi+yuUYR6ZCf86gPDyX+OnC15Jba+3A7Y=
X-Received: by 2002:a05:6102:c12:b0:467:acf4:232f with SMTP id
 x18-20020a0561020c1200b00467acf4232fmr1127464vss.34.1704455149196; Fri, 05
 Jan 2024 03:45:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABq1_vjfyp_B-f4LAL6pg394bP6nDFyvg110TOLHHb0x4aCPeg@mail.gmail.com>
 <oe4cs5ptinmmdaxv6xa524whc7bppfqa7ern5jzc3aca5nffpm@xbmv34mjjxvv>
 <20240104123621.GA4876@wunner.de> <b565j7nbqu67pjhjw6ei7i3nkazazirl4dyxhaem3z7ghii3gs@dngmvjcylrjp>
 <20240105084454.GA28978@wunner.de> <4fjboeaslgcgjtkwemog5qrbbfnew4qcsoyrqbxmt3icesiint@plrjgqxt7naw>
In-Reply-To: <4fjboeaslgcgjtkwemog5qrbbfnew4qcsoyrqbxmt3icesiint@plrjgqxt7naw>
From: Klara Modin <klarasmodin@gmail.com>
Date: Fri, 5 Jan 2024 12:45:37 +0100
Message-ID: <CABq1_vjp3fRWC4HJfG+1VyhYYcQG9tJVvj_LCRQ7nBtTLs8fLA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Lukas Wunner <lukas@wunner.de>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000b46079060e31636c"

--000000000000b46079060e31636c
Content-Type: text/plain; charset="UTF-8"

Den fre 5 jan. 2024 kl 11:26 skrev Shinichiro Kawasaki
<shinichiro.kawasaki@wdc.com>:
>
> On Jan 05, 2024 / 09:44, Lukas Wunner wrote:
> > On Fri, Jan 05, 2024 at 08:18:05AM +0000, Shinichiro Kawasaki wrote:
> > > --- a/drivers/platform/x86/p2sb.c
> > > +++ b/drivers/platform/x86/p2sb.c
> > > @@ -150,6 +153,14 @@ static int p2sb_cache_resources(void)
> > >     if (!bus)
> > >             return -ENODEV;
> > >
> > > +   /*
> > > +    * When a device with same devfn exists and it is not P2SB, do not
> > > +    * touch it.
> > > +    */
> > > +   pci_bus_read_config_dword(bus, devfn_p2sb, PCI_CLASS_REVISION, &class);
> > > +   if (!PCI_POSSIBLE_ERROR(class) && class >> 8 != P2SB_CLASS_CODE)
> > > +           return -ENODEV;
> > > +
> >
> > The function should probably return if PCI_POSSIBLE_ERROR() is true.
>
> At this point, the P2SB device can be still hidden and PCI_POSSIBLE_ERROR() can
> be true. In that case, the function should not return.
>
> > Also I think you can use PCI_CLASS_MEMORY_OTHER, so how about:
> >
> >       if (PCI_POSSIBLE_ERROR(class) || class >> 16 != PCI_CLASS_MEMORY_OTHER)
> >               return -ENODEV;
> >
> > Can alternatively use "class >> 8 != PCI_CLASS_MEMORY_OTHER << 8" if you
> > want to ensure the lowest byte is 0x00.
>
> Thanks, it looks the better to use PCI_CLASS_MEMORY_OTHER. Will reflect it when
> I create the formal fix patch.

Both of the variants seem to work for me.

I tried the first patch on its own (059b825c5234), with
       if (!PCI_POSSIBLE_ERROR(class) && class >> 8 != P2SB_CLASS_CODE)
               return -ENODEV;

Then Lukas' suggestion (b97584391ea7), with
        if (PCI_POSSIBLE_ERROR(class) || class >> 16 != PCI_CLASS_MEMORY_OTHER)
                return -ENODEV;

Tested-by: Klara Modin <klarasmodin@gmail.com>

--000000000000b46079060e31636c
Content-Type: application/gzip; name="dmesg1.gz"
Content-Disposition: attachment; filename="dmesg1.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_lr0kgyeh0>
X-Attachment-Id: f_lr0kgyeh0

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
AAaogx/n4ywgTqaTgR9j5e5f/hcCBN7Owe8AAA==
--000000000000b46079060e31636c
Content-Type: application/gzip; name="dmesg2.gz"
Content-Disposition: attachment; filename="dmesg2.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_lr0kh25z1>
X-Attachment-Id: f_lr0kh25z1

H4sICKrql2UCA2RtZXNnMgDEXGtz4siS/b6/Infmw+AdHipJCNAEG2tj7Ga7sbkGd89uh4MQUgk0
FpJGD9v0r7+ZVeJl0703JLmXCBskIE89sjJPZmWhKqreUFhDac+YaiqGybTfFWYqCrzwMFCjphek
zUcrWTd5Bo88DrhvwicvyF7giceJFwZgNDtNpRHb3Yb8SkPBB2ssF71Ou6trPcatDtQefSu2/uut
0DOoLW0batc8SMMQmNZUm2weqYqqMZUZEDF2lt+F7c06XN/cg+/svqU2dQaRfiZeNJUz+FUzYDqe
wORuOBxPZvPL/7k5H48GcBV78N9WANAGxkytbSpdGAxnJFn/N7XIWFyMbqeNKA6fPIc7EK02iWdb
Ptydj2FtRWYJobyrKiZ8XfM1KC/Kq0fj6FavrbnuA2SJtfD5O0C6byFdejxAzBMeP3GnelD2up/Y
RZ2779dPlO++hXRVAXk+mIzg5vP0PUC1t6DuHtSxUqtqVJfbr0fX3aGWm9KbMPVsjs9/Qm34wu0s
5XDpiQk7A1wnKbdTshprL0m8YAleAIPJ/b8XAzufjAYmTFMLMQGXnZ+gPC/1LN/7VrQD0zGNG1oS
DZuLQ4EfKSbocjxCaVnE47VnxyFM9MuB0RL/62Ju0HKihMk1KEZL7bRUnPpiSGlim3BlJSnMpgMa
B28RW2KUMzHGk9GshOBLTnOGxk1lXaXZU3UYf/hGU2nzJAnjYpKlWmYRajd/rZ1brTxY69Dv/2dJ
xZSIMV+HT4eI1h4x1/8y1sXHSZhHbgB9lE4Gy0Uv8DK3Ynu1uy0Nm1IMYDy7uxOOBTqAqhl7PIGa
Aa73ghP0OzB4smKP2v8HAYOqntVhkXl+Cm4crqG7e19ISoo14qWLenw+M2EQBq63zHJl+6o0Og8m
fLkA+DIAuB808A/eXBfDdMMscIRPH08aqeiBlR7Mo9tGj9HYvXQfisHk5gNQbhhvaKQj7pgnNJSp
bakvxXCQH1yOph93krWOy9tSMr3sFZd87vuhbdF6DfjzCZy229vitF1HK4wzpnWUi5fK9Z2uCGqS
htW3gNyjCUMr9jcgNcJecfsxydbETT0XiZjQS0e6H6cMyt30cnLMia6Mi6ECgqnoUHtCIaMg5f7d
WUmY2SE7uLq6InYgYNQBwbAcBs6/3F0KgqCrmqIONSbuwParpZpxhU9vmqHLZnT0n9aMy1OjMaBm
aBdGO2/GzWz46aAZW+oI4+kVflka22HZ0Zi+aoaynRRdKSOZ+MsrycYgH2fj5033nXCsxBTExMu1
lFvAvZGVVFUXC1e8XGgP1aCKef4hqr1FNWxVf6isr9MfoeaGXr7U3IpQxZT/ANWw9X1frUVBVKZ1
xhfwYXT9YTwcg/VkeT5BFmSy3W4bpX26/VKFMMidKvjhM8TW2gQFGkCugBdmRVClsP8NA46ygiVP
zKLNuRyfg3icCN/Z61jaLUMkACOueI2M5S0We5MqEA63DNYHb7kaI8qbMDYf8VPhemF6IRbJN5qN
JLViZLBhDNyyVxCETkF+LslCvvBITD7RRcdDiAA4nadhb/M0epnB/wHY95MlxcBGSIMJI+FpFklg
5V/oYknU2yCHqstpx1WEpgwiC2eIEgVZsDM+pebtNI7SqR5JWv/JuDHz1jyG0S1MwjhFK/WiK92C
U3NLLuSrgpGWFXn23HNAr++SsZpaB8txMFROEGSb56nD9RSpUUPVynQDqdZ8ejeY336+g9oiQwAM
LZO5F/+Nr5Z+uLB8caGC4/r0d/ZOaL1DtB6s0CiBz594OcB7kSsRHKs2Pr+cnQmDQxGnfRTmeoFL
FpdeF4NL1tEiDFMZqj0TqE45sKSOXVyFaeRnS3FdTPpkbOKILPBKNJG4x9JLUh5TRBgm1tOWeJg/
yrv8ROxee4fN3Z+M7b7O/hTDzgXq+4F0+SJPJ+0NCanTZDAChz95dlGLYmN0/5iEWUxJ1pi7XsCd
xl+e63pIV5BaJY9kXbbZXJF9sje2T2/ub9fFfc/x+TzANzqG3m6znoExJmNtowtBwcYJdzGPeGxH
mQk3d3NU46mJ8uI53qHGzRdemph6fgebkF+QPRZXrBjyFnO4XnCHdmI0XVrzFt6GhKHrNRSIFXDU
XlfRIWNaTzUK7vlEKLNhUZ7F/L5oEB/oa/p/6ErPKA+EFp98MP5n4r8q/msF02kfxTNatvXaCpCL
oxqZcHF7O5uPxufXw37raY33sm+Nf2l3L0Zz1p+c383u70eXfabYttHtOQ3bcnhDX+jthqVw1ugp
mrFYOLamLXr4FfEt17eWST/JFk+h31/K3Tw0t0no836abpTDi6lSR/VUsWOPS2eBY3t0z7Ijb87J
Ntt8jv5PLJGk71svlDjO1nzfQNd2UUs6boN3ut2GrvY6DYs5vQbr9PSu3ukqltGWrUvSTcT7izR2
C66I++AxCJ+D/PpovFE/MWLhaKES+KXo0P9Sh2fP92FB4pIEFT8NIcNgE5LIsovGaJeUWt6AjWSb
w8pKVnnEmmecKb5EuqRCLYwdHqMBqUNb1dVuFxablKMjo/5Z8VlR8onGoPF9cKPd1owdtlEH1VCZ
rleCfSFy5UzwQh/dB8pbhwvP99INLOMwi8hdh0ETYBamGHUJG2NiCxSl2ykGSb7DytKwQblnk2Id
+9HERV/7xuPwrA4rbkXSmJghmW5x7cac02Vxei82yag325iO3FPO9GvbkM7MSb17VgHQNqR7BSQe
ZslE1oAyv2I/0YV05SX7/SmkVAHaggRvc/gyAXRAgFyReBwktDv35NGn1tigZrN5+1hwyYxzbsEU
1lM76scWU/SOrhkfDwhAje6pH/fGwOF1YEZP/wjxM+3z1kHrMPxAHMqrLsPvk1rg+uripxYJ6qOK
d+kb+W4YssaPYK+txv4G0xWDxBAxRu0qOKTTT/cXJnz4gtO3DPoUWNzSiusrDa0OYy+4XfzF7TTp
Y3RBbLWPUcgN9ijpszIuqXVPxouWlVz2GI6h/c8pHQ9KJPLTGA2imPoUF1lMyiK3CRCv3BbB5Saw
1p4NE1yU6wjXMDqzLEiteFNMXmwjk8mFeaQ4K2wj7SHK0pLBPXjryOdr7IkYmGYJmO2DpMqxoXES
KynZjndV8lFDcdztlKSTyshto5wm9rvkuva8sK8XTjDKxwy9axQKTys2PbFroQszJKGJ7G2pzh2g
iNF6BwgxfiQGZ93OfLGn92T5GSeQBL2jk/k8bvCAHBUpA0YWvrWhiVPbkMcEZbDPnb+yRMzWkofI
VJASkO3G9+auhUY1nfvccvtUkHU4bwULR+7mo7t/TNGXaoouBGJ0j65Vb6P4KObWbl9T3mdGiZ4l
1Afpb6c8FV0Ut1A/MxvNg/cNDc/CIj6FET9y0BSHt/hKG0gSi9Fb6KMvgs/X579DV3lR2wXjArRe
KQZ6Pl9a9mbLkeErMeaHclbyB6KnZWXLPMsgjDmaAnS7lE2hmj7FULulCoCevdRekflINmvSU7TF
o9at8OkyJi0mvdmcjcbDO7Tn6OhC9HwvmiKSbqyvADJB1lfFpdpvMLqm5wqi+jSxG5wS1W/j+e/E
9cw1XJsbSMq7r0J7XVc6vbbKtI5qFA7rB9uKIlwm0sT4YRhBLXn0aCcHOao0Swd2ShYepSLriVz1
74wH9qbZBGRErNnV4SJchuPRZAo1P/qr3+2omtEzinK/yb1iwmzFxT7IOsRlHQr3nisr1GZjVlD2
J6qqErlF8GafLvZBiP7xAgy0U+pYPuviuTSI810QZYuB/O4aLwuSughVGdffZwbIWZGcL3NqRTGj
HUabVvJsRUsyfjG2AWkzhavzuQgpoxBFUmhpEa3/ViIFumuG+qoZdzyVPjupQPD24kmF1vbibnoB
6wPAK4yeSVfo/tbUv6AHECblHdvwBvnzePhn0To9kksLz3viME3Jvl5sKB1gwufMD5A7Fi5oG19O
D4XgYkOXH9OSg0XmukJB0pSIKgUeQQii1tEuvEE3Ho9uqaATXc4lhkC7BAoVlh7MW4nCNZfShC/d
DlxhH0TuBHUbrv6cnn8eFpN6hUydJpK2Ciw/lRnoJyQQ23wzRoEFnbHnzNGcm2h1XSvzka1oasfo
4kAE3jpb46VS0OF8mo7Nfa0std5P1n3biiyZ7KjTSl/G+Kro9i0GQD/I4aiK3t2lcBhFuj21kgSO
ABaG6v8Dfbe1I32SqN2p3Z3Bn/gV9EJngCpCa0dtqsr1h29QczFwJEePLr4u+IpPrzHWTlIeUbKJ
Los6RoodRDBywHJXnpsSU1JB5iHXdMEEp08pP28v5pag/X3WLIkqYiP+U7EnPBabcwFG+kOKZrHr
NzxdZHEisz6U0NvdmOgtmhiYjO/BiXHJxs2iRLG53YHdR4b5QykuklJVz56Trl4J1UvIXHI05ciP
43x3LMlls26Jrgv2J7nqUdePThYUTVYSAtUyR9ju0DmF0KkAQVRQN6IsjsIkzxKJoSkx1DKd8r1h
2Z/1KGhqvGVgUfoYhwZfu7SXIAJXtGh6UQ0RwfGHw2zT9H3STWOaUDTNHDlDI09bBElKC5cyfkCF
Jc3CNtiECwoAyOhkEUaAyOocK97IpBNOTUnjjjQCEfDl1usfFQiYhTWmmZf4/JqnVPPh+rWgj/96
5cXrZ4vYYLZ8ED6J5TWnnkMHcNYWctwmbD9GtTYyoO6U934oaxAGaBTFIO3OxWlk8v1wKS4iy36k
RC97NzjlEM7xCkPBr2plc6D+eA7UfA6MwoQ9Z+fL7fkl4W2n4xlGGXVxnAxjTesRo7kkoexyEx00
0qQ0jRKz1Xp+fm5KWc0wXrac0G6t0rXforA+SVuWg9yzscw8h7dWz40njAxaaydp0mdEcnBN0YfD
U8vzi+Ye4VetssHWfjzYWj7YrJSpCbPlKiVLw8QCruf1PCW1mkzkq5VC1LWkVLltGbrYxt0WGcZw
NkYsInFTYx1d7zQ7yi5FU5B8OvwpXUduYpY/kretotvX9OwqtW4+TwWVoeNHJ0u35fHNGlN3u9Nn
FaToKii4UXTW6bZl4WbhzJybpfzl9A49ituFOO36dse+iiAHwxI7jWn/kpbQwezu3kmyRbLBeVoX
L+W6mw1E+tCkg9pK29S7wnaRgdyJLLjRMJwdFYdNruZ469Po5mMLX97d3s+G4qBqaIdo0kR8VgzI
yhzaYDiKsgOe4tg/5iMEte3G41kpCFGlopIiiRu4hhVdb6sdXMiG3jXZmSgrSHn/cLLER+d5jrSv
0O5c0a3bVOZe59ilo6HN78MyRM8coHf4zbW8eJ6s0Pj+9t5QCytYzunfuyNRrD5/9pL37xOlYeei
sqcglB1lZIXMPEG/k+xbDlqKamViwJAVNACDkfgnj0nv94qaTAFZmmSlZF0XmoVUmQ7dUm1w0Z1H
gSarf48rfWlZoU8nWkN7geglyV8WrPJJYzTEG9r9E1HIynLQMtD2Gs02krSjg7m0a0VMthQYGrEF
StxIVDGUTojhVRCmeWG/5fuiNc0yMOgGYnlA/Gj0Csp8pFaTA5Mv4K9sHTXCCF1BvuFwWJdAFdTb
bwDxvvyDtEns7glusZZ8yJZ89unC3KVK6Ag8ndgfexeyQIWibbE33dhvTiuyJKwkpAIfEeQJGc3a
isC2Airwo5ovR2ijddyQgvG45TkYxyYJV19UDDOXPKidAaiaymB80UrKS2UHUhW1V4lUdthWpuvd
iqQetJUxTSsvVRpDy1+GsZeu1ttxlhjVDLJIGbyEMQpkbU0VAuuAsU25bfqjDuAHcGxwgZNV3+z7
U+rYq6jQnt9OR7VxSEUscClK4s8qEjrZ1f5VK1drKjCfDiYwfEGTTS4pqb7J58slGhwrrab1TIZJ
5+NP23K6JBNezM189AyW/XfmkWETCfnQcsqFaNiVAXBKB0tTTbZKFnpZnk8bhOi6Sanmk8tBqbNB
tA2Ndpc2oyuoSKF4o5ZkURTGaQJTBaYMphpMdZi2KzhSJE9sicEQ++dxFqUQhxk5+NKMZRUS+Yk9
B/3Rsxc44XNeVkct+IPcYMBpvq14Uxc7nb9EttcPQjtOfhGzHnPqNrqURVa+NcOuquSVqXKfVvT6
RBtL/eJDXtbB4HoyFMf1FhSbgyKyfcpVFbLbr2QzIZuVkk2E9i5E8nUhh+Ir3lAeMAYM1xYCiUTA
V3HSTWm47kPRkNCOPJjcTJRzRcOPykVpApK/nYZ/PZ9OxjCgjuHzlC8ptZ/AeDqCD5M/GzOkvUWP
9n8HnSinqAKS5YTYGCq0iEP/DxAEX1ghbJgwrGiE5A/LwFE7sXlVNYrMEc0nBj0wHg9ub65G14fn
+upEuX5Lc8IPPG/Vq/BAxGGQ4TuxrDmXKl54ER2tE2ydVAVRG1/0+JA3PxBiijMtQuz2fAx89ULI
jwDSMTjb7eQr9OHdIR15UI6SZu8OeernnpyfCX3iaOD7Q+9tSWGMnXxFadLB867SNUy1rbEHGR2j
ABvjbzpsrBjFf9bqLRJyIPFbWbvDle7BCOY/kUehVyV9Y0d9U7d9Y4d90yvpm3qEpL0fEuMHSLrO
3xHJPUJSTmoGqw6JfMWjuTMjulzPesd9IEBvjXZ6sYHR4IMu/G7rejK6bc0Gt++F35X4ixP4BF0J
LDsY4MWJAWYK6ypVIcmlJ342UvbRzZedolSx2iRIXl8+uhxuB/RgxedDy1wxtMztvD+svofVXOP9
8boH3ezIbnZ+Qjftg252KuqmeqCc6gnltBWtotWvnlDOhVTORfHf/HsFoh10RzvZnXZF3dFOdIeE
N8RTRd3RD7qjv+vs6Kdmpytnp1vV7LQPutM+0R29MlfTPmGSFrbsju1W1503BsiWGm0X/9GxY3KI
9uBVBJOHLhSVyRDHK1wgvu8P23JEpjh0cFh1TkyPVgVHZN/liMaeIxqlflbru2D6Hkzfg7WrJKTH
iJryvR9qqR7xs+fwMP99EgxP0hUkKwtjFFScu9vx8Q+u2q8iqcp4OEXC+yBYBjGsMulwnIg6pTmd
ijTn/4KsXH8O1rz6c9a8esT+mWYo7x07ndIOtaFoD1UBvJktaZTzn6zt/bO9K29uG1nu/79PMbWv
KiYrBIWLBMhEyeMh2XwWJa4oef2ycbFwSnjCFRw6/OnTPQOQkEQdHoD0prLatURCYv/m6Omenumj
IcaQX2MMfcMYg7q8WOEJZT88oTw6K5Ck/razAuiiLDaF9FwPDNap6ejLJiYNwFTaLSDYg09Z7lY7
rAH1ViI9232UPCg22J3nam1Q4T6mZUhfNb2sYcgX9ZrUnF6jiNLe5kzaNmfsfAIzP35rGOTxnMmb
OZMbnjNpn3NWqpRtgl5pjPoepPyLULuV8up+pLxaikMm5WV5sGVpyU0sLfW5OCxG0FynPaUvm5g0
9blYZJxhMCCjllG2HUSv9GjDE6bYzC5UfZ/UbdB+KRHX941TiUzlpqgu5kd/LUmjOxTedU9FhkGm
yjVw+VSxIt9u6gx9myBSv6HDgImpcmjQte1gyHO7KcgXpFPJg83sQV+AKjjRqHBiY/bQq73bcgf5
MwZ5y73kfpvx5l3lz2jOK/eXzTbn8aVmFJLTy/moSBdX0/mi8Bui7jfUCf/k9PNofadfuFbOzn8l
0i6QxtuQejsAmmztkrQDpOnekI62IYk7AWqiWswLxI/31YvjXfZC3Drr8g6QpG1IA87CTlEQ5JjZ
lCbSIIXPFe5Yh5inIExp3qJ6tEFQFXQxi48X3hq+ZzNfIUxqYz1ggbDvDzTPA2eil8lytomuqh9Z
53smxoOus8ejVzlzA+3WmU+U4dQYuFyOK+7zfCTz1GSRZhU/fCxtRX0pXbRsWO4G/EPeNL3vxrjO
zWYRisP2TRc4g9qc7MQwn6ZcrUurZGcaYIjRDuQQVrpem2wZXpcCvcvTk9H46ORoSiazxfLsViWT
0Qm+aiKTmhc4N45Dk/beYeyvHWH23iIKe24kNGVs5SPkwzr52gdipCTHnAQYlGM6loHes5hENr1B
zgAOjyJYz8mVM6w9IHno4yuM+Upge+9ZNOHvHXMlKZL/NDAe278+PEkj/4Hc2aswdawhUXWRXdnR
R9HdkMDGz7EtXccHGHhVPpHEIha2XiqOii8xdVwvpX4td+n3jEFl3q206L2mSIOB1JN0+gh7L/d1
tzcwVFXER6z/cl8RFVmxHPXJCDQwErghpmmMVhixu6JLMHVoEh2lCObd2ZBMXlgWyP4YCoUVA+jg
hClpwTsSpG2CUSKbpfacs6hAvS0i0NfMhRTgHVKoV9yTZkCmxZdZdrJHZSbU0poa1DBn3zFwpxGx
8iTBoL7KX3drlGAtJRWWd12LJDunBxJV6VUO/G4GkSYC30TWN3q7fntlGIk5LOMeUfZivgLMlFqo
yKaRCjO38ENfBws2DbPpAHqbYy1RZiGnh170rzCuneguXL+mU3kYRiFnM0rQOpE8jxicZVZlVQWq
jPZkXXMOWhiDmAsXTNLjXpabDinOC5jZgwxUcVSw1scoFivJUipzL6Pyyjfi9NHskfHonPR34Ovw
ekPtTTUtrIr6x23o0xFdW5uvtZid3z5rcaNH0D82vv9Hml2tUWS+wRZ/gNZaT+tp/5FbW4Ea/PFb
64hPKmX93NYWhxBFg7en32HNtKLct+kFpOnULOO+FbRSABFAnf2AlsX16JG45e4L1NmAOuzOE81z
gHPCnQAWd5L0SsTU3D0AuhvAkoGaB5SeR5CYO5s/eQNmarpAf5i76FUFyGVA7s6BDAZk7BzIYUDO
zoFM06JzZLq7niMG5O4cSLUZi9vSjoHkgSrQH1pjQKVSRF8MOzCIXFO5agUd5VsDZsuQuFEe2mRQ
r6ojkMP8PEMyrXVv88h2owXx4uBpjrqtGeqe5KeTRb2niTSFXJju0IwsmthYHrcZPGsmd9tsQTyb
RsVvTa7XV/RdZdfLrHjl05xQK3RxwWK+K9qGbQ3pSZsifFggQhz0G2nEBcIIsZNkeWLuvQjfxWRB
HHrK5aXINdvwacr2El7pFInxm0I3vfAdsM1OPOAOyac1Zlq9/GxVh4Nlq8cW4ivePPkL7GcW3Tjh
2/kj5U7B8k3083K6eJOXmwYUTrzM2S/qFvF0eTr7ijkmT84mo5Nm5NTzoAK0+AYg/VNMEA64zx14
1Ea9/UrHoRdxpQ2utIOw/T/DhRryU94345ThAPSI4i3cHQQFvIwrb3CVPx3bf6pj+/sgdyjc/ow6
2x3kzqZNfUu07EwnveYy/qd3eC0H5Kbn7En6pDJrkrqHnFglVm8PybBKrP4es2CVmNqe0l9JFUxp
J3u0F8DkfQVzrxHFRlXDCyDSroPU5G1j2Lw6eBz8vPsxVPY5hsrex1DdNoaNqJ0XQKSdKJwXwOS9
qBp1j6pG3aOqUX+CqlH3omqoI+bkZLn2uOyUHrnwhPNEKsSCPiy9tpclRuCm3FXJyuqjlJK9rjkq
i5w1R0v/8dQpr3iyJE8x1PLGeUj4axLcRdSHMXUy5pedZkYQr0wvSw8VkV4/0FO4Q0knZm7dOFnx
njM+5ruZ2/Uc4bYc4I1OPjZzbHcfJUOYKiPNaSmjNHIzWrfKunasmzQPSBo7vO2Gr3g2m61SmMHi
Cx4qisQS8DsWP1kQgk5mXfdVgRKHh6pa5J3nJUtHgqWad/PQYkWZnwC1Kiicp7GfnQcWkWJsSsTX
DUwZbUjB0iCxkWCR7A/3PXHwoTZxM4LRcGAoImA1Vtaxr9apLTGmeax94wHaSMOIykqgLTO9apcB
KGUkkNhVi8VDWoHxzyghck/hHHsvNeid6dIywpBONJDDC1TLSGx+wVeSPY3Iws+vyL/AD+OhdLal
17KcQVYwLFhZU5d74oHU7/XEYnSwsBuNaO/QmAQsY1QpM88HhnqsBxIxe1hKmGBrdnCGGfRcnbS8
5H/IId5tYfGZlWnkNobfSD1ZFNsYf2IQ2rgRP3CfAYsbYGUDrO4I+PPH6fiRYEXkgv1urmwz4pQk
p1Eo3EZYBd13CjW45mqpq/Bqw8zxgRN0USbnpx+xsiGtdcNZddsL83tiXMVXRpJVgstuxa4kcraw
oCZ4tKWPkyiz1nt6XySTay8G3ds8xujjghjspthB5uirc/K3Sr7mRuII7SRYWVEYwtiD7KgrW29A
bphelIJs62ltrIpgk6vEoRUusVAayEnbibHsstYDSnTTR3zH5Ry91Eo9mtsdR8s2YuAgMppNtK9f
v5Kj2XJ08OVkfIBHhlQsfxqPyPR89uXovAOL5JZoXfEvpM7Xv5eYhmdp+mBALn3YckrAExTPoL9N
/qMeSEF7uCH+m2c7wHUg8oFlRh0GNrMPNbyrPwBtAk/Gac0Rlf7fjui42RE1MmMVe979kzzC5XZA
7kpKzamSNyA1KSl1KcGnoW+L0cWIVs++nM5HBxLmLQpszMfjwqvMp8qwT8wAfcWYOCOoGCXYGMWB
EMO2TOSGl1+B19bw2iN4ncH36sI7kliqhtZ5myzOzyj6qZOhiUamVGXWIT2JYjAUr66zltUm0mAw
EGDj0C+U0SRKYAtFg+L5MR77uDvZNaCio1QlKVSHjVa/Q+ajSfFLcaiIQ1UfyupQteF/zkjua8tb
XVv2k8TUl59A3nzCCh4TFlLm847iCwAYLY7x9KzGQ6kBO5vbLfxFmAcmbHikRpHLTQ+R2fa3UeJ0
mgYwXRElXpyGmdw7hzw18Z+E8dVswKoWAeDYX5zQjpJDye6b+HaRRHZuZYeYxg62vJbNym4dkn5X
1BpuQ5rRE5QhmbvJIezsS2y5U1gdp3T+eOuwbnALwo2y5Zr43Ahz2Lfiji8pN7X9LqhVIbF0gZEQ
cBYl4cocaD1dVQaSY2hrFqjbgOpYDR/xEx/l69wk8JEh9b/B6cIHNSzIR/SKRVPTdNi2etRdSx31
x6SO3Cjy7qSOyqSOrDyTOnpNqSP/AaSO/JOkjrxLqSP/bKkjvyJ1VH4pITcsdeSGpc4P5N7x411j
GOnueyGkGWxPeau4ebqo4jo4XbBzyeWBXGYYgBXAJrdbj3QSmXjoWMyuh6WX/QdOmilwdFSQJp/H
UyYLaW3tvtiBbyrbnnHWkc2slRVEKSluq88vJrSU8Z1x47C8nUu1GcqVeTVS/K3YDF3DN5IgJXmM
blxR6JAA5vK6Q2S1uAok4W1iBPxWaBftJTAEBR3Ey4UiiycXoiwKg398lFSQziBilJMvc6lTMRQV
pSZcX+4BcaycnNLjtBSo537mgbEEYnU8gl9wcigaeKs4zYwM1tpkcUkTnfms3niZsJVTtHk21iW+
I59mU+Lc0sCcYs22Jm3ydy/xyOco9UKj0ViifjO3fUWFTXLOkhixyhqzxW2f90xaSL0sJ2ejOWnN
4Hu7LsXAs5IIs5LAtBWZaxLYOqT0Mq6MG+fNilkhfhnbtEg6zSRERcCwEpbOG6k1I+k18NY1VrM1
k8iwLZqXqV4N7A0vZEZ6gzydrk/DOOXhCTSN5huLghjLIQteSL52e+KAWE6Sea6HFeQ5Vdz39M6I
y/vu4j6VXh3636OD74rLnQ95nCVuWtDtkO8gBO3DMOoQN4XR8LIHeMPpVjHHO+W5ceVZhf0wJPpQ
VoYap1KIYZOb3axrn4HaTSPfIb+HTgavxW/1GIJRQYr0NT0q86OrK3p9nxn8ou18tMQjswQVOQ1N
OkoSEMrQftgy0OuOSpbHbo2jU/hr+h+Z0k2DMGLFbfELjyLp11MdRFD7kMWvsEzJ6HQ5G/JmrE3t
Df7vqW18q6ihniQLqE1xPGEN+KzkMpgrLWgM+Tg+kAc6+eiN201BY5gkQ4yvH9IKZFMAvyUYbgZb
Ndx746VYxJsF7jntOaZCXjph6qANQhSD0PPQZptOc86tRWgHxKFhP3toR06KVZIL3U6mizMC7Hp8
OWqqMQv0A0lQCAewCII8oHfFNAveJtSV050FABDSkPCbjN8U/Kbit8aYfJRlBg18pnc1tpfe8AvL
WQBmCd1MsZDzFupUIsi8EaCXZSI5GpG9NhQ7JKXR2ijYSj83zO69zpSJe+FfrvzINPxf+K64Zi55
iHKwA0KayRAzdBYqC9NrAgYsSArVwQchnt4PeS/TfsG2OytK7pCS5mw06H1sHRs91OEB7jcwRJQ3
QP6mDPfHnuchvYa2asih8cX58XK4PnhKPbCGJMWwbNUSZEtRBNUUNcEYqLbQg28D3XFVSxXpB2wi
4SyH+CFJ7PV65AAeH9Ci0in67bBUpLjLiJ3kQCQtqV2jlbTYOmmV51Ow4tpD4npJmoHNkANbRC68
9Z3CA/E93Wi6NYwh7+8xaBjs4Fb5Sij8ptobZz3Dv4pAbF4Hu2mDmzhOUcMlg5d8IF+QNeY4tjCT
dFpbJt3abYa5TcV8FMLWHJi9aIk4lDTOXQdQyILYBUUeMNx6Dq7FCikWoEelYQv3RgE2vfR71aU+
p+Mr03wxU9oIWCBlzn1GcK3j6Ah0eMCKAeUhqZKucwr08zwkB6nphQfYAzy1oD8BHTdlvB6a1Aw0
kqsczc10yO3oWWlaraY44a2XRCG2pkZjPp3Njw4P+D9/cXQ+P/TxvJifxvjs7GI1m48+QktuAyT2
XXjP4TOnyRzZwAkm8LfUV191UOqLPbm2g5IkolDLokiIDZg1AO2/CtpTlX5t0CS2hNiLHTelEhVQ
NelVVFUb1O8qqDgbTx2spHCZh10srwZ/QW4PCT0BI3MqwB20wKnJn2DlrSjsQOtvHW7vDT+KYsog
ue/Ucm9nLRYCqtCxhoGVwVO1q+rA1PQdaQFhRRDhf5gZbx0XgDlsA8HGXvwN9ubXRtaF/tXm9IH4
xvQr9af/Tlf6snbtVl8d0930b/T9p2PQ6l7MjsDlQQ3nRfKbkaCz85AsqXKdnSHvgcranHfRL3nQ
E5496tPcL75nZSkTpGcxHk6iX/a7Pt3679mizaZP7Mv6QU7TCAH/CbKotut4ZJ4tT/CgtAi6KVv5
b6zLpSEYeGmxcYmC4pj2P5sHLUeWBMYDZutbJ8YGG9R0ro1bh4DtaGRo3/Oe3JZcsn7R7ff6Q3J9
F0Thiq2gVXlU2KK+0cCtiYMHeXaXLHzHSGmDYQQyaj4Uh9Zg9aBo2EpnhTO+QrHSanPuvM4Xk0fH
2aERwHdMP0PSCGNr2F6fTRYVJQ0B5Xa8K9KZtUvSAg66kPnpLpt/ery8VbsSMUGsWYUf5zvgZPWH
5Kj+ukuz2i/zZL0gR98DB/s62zNcEwvqUMU3m+I2wnaw7DupR/OFROq2QyuMoWaFR+XxLh/UpDzJ
3Rx1YGa6yAcJQ+w8CNZhJDqogV7dMTqazqbFoQ0ViePLpVSXJquRMTm/oPVM8GpV5CPpmhbe8px+
kUnLNVmAR5yAeZU8vJh5v/YYuwlIpLK8QDHUsijea7XHGr2+wy/4jnaJAhU4LUWej2lswnERJNrm
Q9vighrGakrDUZmopdOMfql8AF4Y56DfFtEdNHucZxnMMZiIB0WOyYOT06/Lfywv5kCGvQaOwteL
04U4ESf4kpJg3zl5rQzBQPQnbfl98dv5+Nte+oZIp086JO+kQ8ecHQK1ngSGT6CxF5/A1CxSYFQ9
Eoo/WeH1mVin8QWhIbkoQP8LvRJ+v/h0Pv8G/K2QCSdLH01HEzIHlfWF5lPsgujlI3Q8BUnEgsTi
KM0ErKBDdFnUtBoN83RZ74vD4iez27aabT/QVSD30btFsRTlWSmDQEIVphWDWjm2YVU9eMqWTI++
PIqDIq3F2cnJ0bTO8IPo4mtU+enKs8ZbGBvot5+tYqtMops4RQle84EFYOIZGQ3BRF6thUJTKAlp
9gB9pqaYoumkBepB09vMsV/rEJrDF1buZLlYdC7OZ8uL0cVRZ3I2X4wuOkfw7Giy6EznI145pYvS
Kg2qiW0kt6uA1TEfw7Pyit33t5aleheCbOE/AWiqB2oZspj6EVh9cRTntCIhKGVa4Xg+a9dGmTME
Vqb7XpIee+aQByfr0EceWlIhWPv0GHS5mHJOZgwMTM9AEoEdX8P0gi3m+MzPzH4h0uRdvbqYnK1u
qUvtqugBRivhe6F4fyjWIH1nZ+sXXalr5FkEPaE3n7geMaN1Rk7PVudHeDJIXN+46qxr+RU5nHFh
XBuJjZH9B5jeuZ7CnJBl7Bjw9JG6jIFL3CgJDmIrjW+SqppU+PAs90oXZUl6r8MKDecGfYf8SmNu
DTDDwe7lQz9hHiwbGPIhBYD02qH33aas27araobjDizH0D40hnLnYObrvmSJit7vSYZh2pY7UE1b
NCzNdcW+pcmqbpuSbvVF8UNdM03uD94w08pkyjXMtJI5KtPTXTuA4H1bQLNO4DHik1ns2iZxDZz0
4iQfnVKIINdlqYImLCEK+giw6c346WyCbuI3uBu5jAn+3dyMU3Kc+z6Z5rHv3PNBpqG9os6O+r1Y
VQ69wgcSHq9Ycg9nZVgDjd0+lwk/oPu9gaKLOPsWls7TeypJjQDak7YbbxCFLowvLLjHKRQ3Z93D
9X1xIe7oncHmthgPNq7YFNOHeCRevUJm97steaBzdnaLr+ZiNPn8nszv79po21TmSX1N02RJvqF3
3mhkl71Ru4QsEg9vfB+Ggkyc+4zetknEsJIohRfrj3JuBr9eqIILnIGOKe317Wn1QtweKLZiupog
aZIsqJquCbojKYJmiQPJ0nuuJMLiOrhji5cm0gECKJmpT26X/JpHxevhWl9tO3rS3rHjXwoT5hl0
8sJ1hKz/QIIWO0xXmNXJx3PS1yL95cE7eAVvvUteKR1MPHsDcFPA8pFfN7pKsm6bq0QLX8a6JDdq
BzbSb6idN672VPU9l2zAubDXDAGvp7yBJ6q18diisIXSL7Ml916/wFQV6fW7JLX348s0D+lCpRcf
P7ZSu3/5X05WroSH7wAA
--000000000000b46079060e31636c--

