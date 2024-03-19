Return-Path: <linux-i2c+bounces-2404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0487FDC0
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 13:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7990BB22A88
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 12:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B875A4D8;
	Tue, 19 Mar 2024 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="eOFh4qc8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9676E56742;
	Tue, 19 Mar 2024 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710852457; cv=fail; b=UQwbLh99PqOa2jZ7zPlTWct5TWpu5/DnDI3p4VdudGoeNHRHPJABwtNyfWlRrj8i2yDPoeXo/yt9mC7Bn7+yEWNU0ElfLPDBjbMDvfJz4Ze8mQXIKLTBd1JFBQn2eaukSPk/sSkc0ZB3PVu67CM2IRAor5n33nYVPxrCoA5leKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710852457; c=relaxed/simple;
	bh=F1fTH/2od2kDeD09Q/SsJz7yn08qzLSlT9SWtEzSzRU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KOq1kMVTx6vHcXDsdODmhSA7/Sh9gm4hYo6R/Lz3OqrJAwAv6CwjV0XXy7bQWg3mopPpN9ZGlmLp7/TSRSH7lsyhYldEOKznEy0k8bTvJ+JjJubewHk1cnmciJKwa8Xk5uQ491phd2Hdpg5c1qzLe6rkPj2GlYcFOdI3GBoSf/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=eOFh4qc8; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42JCiJ9h014761;
	Tue, 19 Mar 2024 08:47:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=DKIM;
	 bh=F1fTH/2od2kDeD09Q/SsJz7yn08qzLSlT9SWtEzSzRU=; b=eOFh4qc88WRE
	rvjTGiORF8PrYGG+/wxVpCPtzxwj0/0FygqAaahNTzXQIdc45aZD5usy+nG/BuHm
	Fft1XuSfDFnf9NnfrX6a+puZ/+wLICUkn1XApJkqVMyZID3fUiLwXnYuogvKmEch
	VTDpzTIEPbrgkLm1C99nHtR7T0PabydvJOE5Enq7hc6E4Ey6YjxAuc2DpnZcPKNZ
	UvDd8sH0ioqNzSWENIFLLamr/zo84YALF6Hz0xL42bwJ/HBfL0/d0U97ic/I5TcQ
	K2971uGfv604vv+BK8gtOHWwj5SF1qqA/4KpM1TC0xK/fD8sncOUMASHzYrNOuiC
	9S0vyTuAgQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wyayr80c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 08:47:18 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mtnb5wqVx5Qfo7d+lnHFLR/uKKgKL21v0ghm6pNTzTcXdjaozni3A88uQC4Y/2nrimp6CPRjpI7PEADXX7FpADr4aG1zKlfmJDNStrymnel+1IKya8KZ8eC0MvkU0QoMHmGTETCC5LNlMU7sArTuNeLM9I59BlHXAsDdhzwxVut46MqDNASMgud+zKh9bE0vSwJeR9lMCmOOFHGrIgaAIzccLw7wQJNBEjkHAtL1VEqzIQAa12zsLTx0+MVAFkxXI4QZT+ZhEAV5gxMZGvppKWEI4LvDHFi78KoAZ3TNg2BGAefKvjAxnQ6iq8JjztAk0pZpkrOiDLXFIgymGFmc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1fTH/2od2kDeD09Q/SsJz7yn08qzLSlT9SWtEzSzRU=;
 b=YFx9FLwYDAMQtCmE6iCge1ZpyrWtOHBiyxb9DlKFeZc19YMgHsaT/Aqu7ezNsCH8Zur8wNyGN1Tefe5BAQZlt0lWUmC4wnOR9HN9rpOmNUSr8dBmOSTXJdQjmCTelyE5q6dZ8Vbe3r4r8LkQ5VZ8XAnVNbfIu1B3LBR6bj+RBrVeIC/gd9dAlUNbBFTSw+F31QZ33Rx7sPqCAWLH9wjyV53EWtUD7zU3keTCNAY59RdMtKkjsK1mS7knZ6sYnJeEMUTLwWe2LNt84HeUX38ZYVDEa1FFZdBNQPdcimedd5ssAyvfZhbWEATZ1P38c0i9UpilCTfSNvTQq7tcvng2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SA1PR03MB6499.namprd03.prod.outlook.com (2603:10b6:806:1c6::8)
 by CH0PR03MB6019.namprd03.prod.outlook.com (2603:10b6:610:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Tue, 19 Mar
 2024 12:47:16 +0000
Received: from SA1PR03MB6499.namprd03.prod.outlook.com
 ([fe80::44:7752:4ad:9382]) by SA1PR03MB6499.namprd03.prod.outlook.com
 ([fe80::44:7752:4ad:9382%4]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 12:47:16 +0000
From: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: adp1050 : add bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: adp1050 : add bindings
Thread-Index: AQHaefElPrkIMUXvjkiLIat9R3wUf7E++iCAgAAHnvA=
Date: Tue, 19 Mar 2024 12:47:16 +0000
Message-ID: 
 <SA1PR03MB649924961A6062A30AA47A6CF72C2@SA1PR03MB6499.namprd03.prod.outlook.com>
References: <20240319113213.19083-1-radu.sabau@analog.com>
 <35acf78b-1a0d-49d4-b9a2-4b946508f32b@linaro.org>
In-Reply-To: <35acf78b-1a0d-49d4-b9a2-4b946508f32b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jY25OaFluVXlYR0Z3Y0dSaGRHRmNjbTloYldsdVoxd3dPV1E0TkRsaU5p?=
 =?utf-8?B?MHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dVek5XSmNiWE5uYzF4?=
 =?utf-8?B?dGMyY3RZMlkyTURjMU5UVXRaVFZsWlMweE1XVmxMV0UxWVRBdE9HTXdOR0po?=
 =?utf-8?B?T0RWa1pqRTJYR0Z0WlMxMFpYTjBYR05tTmpBM05UVTJMV1UxWldVdE1URmxa?=
 =?utf-8?B?UzFoTldFd0xUaGpNRFJpWVRnMVpHWXhObUp2WkhrdWRIaDBJaUJ6ZWowaU16?=
 =?utf-8?B?VTFOaUlnZEQwaU1UTXpOVFV6TWpZd016VXhNVGsxTURNNElpQm9QU0pTV2xG?=
 =?utf-8?B?WVRUUlpSMk5tVFRZNVRIQkRZMFY0TUdSRGJsWnVUVFE5SWlCcFpEMGlJaUJp?=
 =?utf-8?B?YkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNTRlV4VWxOU1ZVWk9R?=
 =?utf-8?B?MmRWUVVGRmIwTkJRVU5sUWpsVFVpc3pibUZCVm5KcGRIZFhOR0kxVmxwWGRV?=
 =?utf-8?B?c3pRbUpvZG14V2EwUkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlNFRkJRVUZFWVVGUlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UlVGQlVVRkNRVUZCUVd4SFZFZFdaMEZCUVVGQlFVRkJRVUZCUVVGQlFVbzBR?=
 =?utf-8?B?VUZCUW1oQlIxRkJZVkZDWmtGSVRVRmFVVUpxUVVoVlFXTm5RbXhCUmpoQlkw?=
 =?utf-8?B?RkNlVUZIT0VGaFowSnNRVWROUVdSQlFucEJSamhCV21kQ2FFRkhkMEZqZDBK?=
 =?utf-8?B?c1FVWTRRVnBuUW5aQlNFMUJZVkZDTUVGSGEwRmtaMEpzUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdk?=
 =?utf-8?B?QlFVRkJRVUZ1WjBGQlFVZEZRVnBCUW5CQlJqaEJZM2RDYkVGSFRVRmtVVUo1?=
 =?utf-8?B?UVVkVlFWaDNRbmRCU0VsQlluZENjVUZIVlVGWmQwSXdRVWhOUVZoM1FqQkJS?=
 =?utf-8?B?MnRCV2xGQ2VVRkVSVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZaVVVKclFVZHJRVmgzUW5wQlIx?=
 =?utf-8?B?VkJXWGRDTVVGSVNVRmFVVUptUVVoQlFXTm5RblpCUjI5QldsRkNha0ZJVVVG?=
 =?utf-8?B?amQwSm1RVWhSUVdGUlFteEJTRWxCVFdkQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJRVDA5SWk4K1BDOXRaWFJo?=
 =?utf-8?B?UGc9PQ==?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR03MB6499:EE_|CH0PR03MB6019:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6R81zhiC/uYHwlv0AaL6r43wJGAh17nMaKGigfOmSxRtGIa0tbcAiBfsueEhriGI1Th96aXtVHZ2K/Vpbz/5MvuLKE+Uj8a8/8wt48obtKy2GomFJW7eeMV6Q8kdQONZh0ehOQd59YmphZD2VXe2ylV3g80d1/Y/BiQGnU5TFLwu3w/z8f7vwUnDy4YRN4ZaAf5b/3/JUuX28+SjL3NljYfUMm67BNkQ74xBBCYOfKb3Ql/RMUc8jqM+smCOWZF0tVTnOykZLXShbhAkXhY93KddzV8EkoOlk7Yb87O/KvvZw9zZiKnAiQ1Db8mkQ2yOrHrCJ5oah3/2Mv8K/18Qrr2hCicV7WYwFul4k+kkPPVpI/OI8KIIdNxLH3PBDRUZ8CmlYtHc/rJOQ6l4/UPRdtnCzFNaGgt7Dj83QOmbEb9bHaLtVp/+EhS0FR8nAkRmp44j+s8hjmh43MAC3m9TOmJWvKrfUkG/TqFXdP6ObYHBG53CpeAinCrbwfEKW9AgeAu+Odqv9+El3abYi/tkuNRX4IOaghjlgSk5ItsRpoyQq26WCAViMMBFSEjBNwrJyz45HU/pNOPr0aCXcCdLvBwDRC2fwUj7Q7KfKX8Pnj/xTUaurMOejEu+68XKZDMawRvJBHtAxpyUkjPunhmfh01Sddnwdp8IaVckLxZ9P7v5N+M0Jo45gO9wOrHnr24Pz5ofrag1xGH2QYnwfKG2qw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR03MB6499.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005)(921011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Yjk5WkhCMzQyUEhlQUJJWDBPcVlwaXpiVXpVcFc0VkRzNGkzbTlNYW1rdjhv?=
 =?utf-8?B?aWNwUDJwM0RVRFRkL2tKRHZjWm02L3dhaVpNOEM0WFVVUGEyZEVFNVVQZklM?=
 =?utf-8?B?T2lOVEpaUE96WjhJQWlSR3BBMlBKaUwvTEVTdWpIU09pRkRRNHJEUUFvRzdl?=
 =?utf-8?B?N2JkUkZ4SFpoc2gxUjRQR1ZDTTk1SmpxaXd5TlIrdTVueFE1dC9HY29WakZs?=
 =?utf-8?B?bUEwSTB5bEs2cWNFYkhXWlNsbXdQZmNGREVKMWJNTWhpVXF2WnIzSUZBcldw?=
 =?utf-8?B?c0VXczRHTXRVN0l3TmFHT1JVcXZrRHR2bHp6dnFWVWRpSFR6bUxVaDVKdUhB?=
 =?utf-8?B?YWFuZ2pZUFRkblk2ZW55c2NiRG91SWlkbDZucnJSZUVqOE83eWxZbGlaUE1U?=
 =?utf-8?B?RFNkTzVSQjVpNUdKSDhqejRyWERzWXQrZ1dpSjROZGZaREhaSFlmMTlvRlJv?=
 =?utf-8?B?WHEyZVhYbjBWYlZlUm9QbDdqc09jS29rSHpGaFJOUnA2ajNUcG90RjNVQndU?=
 =?utf-8?B?NzMzeDljL1EzZTZuZU1QMGNsYlRZVllZNmNqZHp6TEh5YTZyMjE5empiTkFP?=
 =?utf-8?B?cDFTNnVlY3V2a2NLMlV4MVZFVjFtc21pUGNQQ2VGd2ZnblZIYjBka01RTmpU?=
 =?utf-8?B?RFAvWSthRmQ4bUVZMEg1L0tqc3o2cjV0UFhLNFlNYzF5Y1ZJTFhZTHN1SnRM?=
 =?utf-8?B?S01GSmZsR2RXUS9CUUpyaWVEc09TVGNMN3BudTh0VE16bStWQ3piRnhBZHBF?=
 =?utf-8?B?ZGxqKzMyOHJBeUsyUnU1bVZURG1mR2R0OHRaVWtvcFpnNWJzSGx5ZThneUVi?=
 =?utf-8?B?dDc2eDlmUXYvNHhEdDdUdDRHRURCY3Qzc1JOdjExdzNwRm9Bb1pEL0VVcE54?=
 =?utf-8?B?WENuM2tSRDdCNGVQYUJmYi8vc3M4L0pEbXhBS2FYMUlGdlI2ZWQ3TDZuWDVx?=
 =?utf-8?B?L1ROdDJUS0dkdzRGNU5VK08yeG5KeHd3RlcrRVlaSFNvSmdnRnhrcmJIWGFL?=
 =?utf-8?B?bnEwWUN0azlTVGlxOHpsMndWQnZOYU8xZkdvdEh1Wlcra1krRUJ0TEdjWlBN?=
 =?utf-8?B?bENOVkY5WmdjL21LOHVXN0NESFlnQk4raGNjaHB0YzNGSjlhT1p3VzhBTlBk?=
 =?utf-8?B?K1A3Ykh2UDU2L2VrSnYxSVB2UysrWVFjRjlZQmwwWkNrQW5DaUZrbUwycHF4?=
 =?utf-8?B?SkZaeTZvZUNIMmpFMytaWDIveG9ZZ0JvRDVyalJtOUwwMnFqeXR4VnlCMFht?=
 =?utf-8?B?NnF4cXV1Y243d2ljSEgzRUlJM1FFWjB6RldGbmJLd0ZTcm4vMHh4ZjlLZG1M?=
 =?utf-8?B?ZzlSRjc4OGwySlVjdGFvcndSQnhrY093M1IzTVZmV3MzN3VLUWZtcllET3Mv?=
 =?utf-8?B?S3psTEVZWVlzMzRVQXNsWkRmMjBjajhXQTF0RXJpOTBWUjhXK2N1UnlJY0tw?=
 =?utf-8?B?T0pxZXlDYnFBZzlYMTBSc2hWck1CY3lvQ2czbWZnTTJFWnZzTEh5aFJVKzY1?=
 =?utf-8?B?NHdncWtFVVFzY2hjK1h6VXcrc0o0VC9XM0RheXhwcGtmRHlOSG9xZUZwQlRY?=
 =?utf-8?B?Ui9rbWRua3gvaEJGRGczQnVyTGd6ZnZKR29TdUF4ck5iYkJ0eWhyRkliWTFI?=
 =?utf-8?B?VHhzMmtFa3hBbzBzbW5DOExYb29VTnNRZjc3eFZjWXRvak9XS0poVkRhQi9i?=
 =?utf-8?B?MCtBVGNtcVNPWUZzNk5hUnZkT1hhajdzREYyMnJYZmlraEFwbm1tZld1OVph?=
 =?utf-8?B?SHV6R2psWjRyMHZXdzF1M2lYVHpNZDNRc3FaL29YS3V4cyt5VXUveVZiUEhU?=
 =?utf-8?B?NWwrM1NNSUxRcXp1WVBrTjRTUVBLTVlncEZadFBySXVtRmJldkY0Ynd1azlC?=
 =?utf-8?B?bDIvQlZEU0NBb2xXYzVSQTBvWEtKeHM0YXNOUjQyby9RMGtMak12Q3BVMGdK?=
 =?utf-8?B?bXFYeHZhaHJQeEg3RmpabnFrYmk0VldyRi9hVnF3VE9oclFONEx2bVYrcUFU?=
 =?utf-8?B?Skxiam1OdW5PNzRhS1pGVHREbHhZZmRWM1BMT0VvRTlPMmJkU0hUNGFwaG1W?=
 =?utf-8?B?YjNRckd1NUlVU0Y1SGtOQjhLVE5MaWxPUkZ3ekI1TmRDd3pybVpmY3RWeWdR?=
 =?utf-8?Q?/03V2RCZEQRUvEoskL+Od0DAx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR03MB6499.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e856ad-e70a-4639-d0c4-08dc4812b52c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 12:47:16.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbMuHn8rVTgwO0YPzJhaKILG+D7WP6vSNc2tfD1d5Bm8po90YlKovmU9BNXz+oZeHUJBGyYmbiXV7iGzmLk/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6019
X-Proofpoint-GUID: 2mGaCdGVqmIn7l3YN31JxV_4YVue-yEG
X-Proofpoint-ORIG-GUID: 2mGaCdGVqmIn7l3YN31JxV_4YVue-yEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_02,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190098

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8uDQo+IG9yZz4NCj4gU2VudDogVHVl
c2RheSwgTWFyY2ggMTksDQo+IDIwMjQgMjoxNSBQTQ0KPiBUbzogU2FiYXUsIFJhZHUgYm9nZGFu
DQo+IDxSYWR1LlNhYmF1QGFuYWxvZy5jb20+Ow0KPiBKZWFuIERlbHZhcmUNCj4gPGpkZWx2YXJl
QHN1c2UuY29tPjsNCj4gR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stDQo+IHVzLm5ldD47IFJv
YiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpDQo+
IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmENCj4gcm8ub3JnPjsgQ29ub3IgRG9vbGV5DQo+
IDxjb25vcitkdEBrZXJuZWwub3JnPjsNCj4gSm9uYXRoYW4gQ29yYmV0DQo+IDxjb3JiZXRAbHdu
Lm5ldD47IERlbHBoaW5lDQo+IENDIENoaXUNCj4gPERlbHBoaW5lX0NDX0NoaXVAV2l3eW4NCj4g
bi5jb20+OyBsaW51eC0NCj4gaHdtb25Admdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgt
ZG9jQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDEvMl0NCj4gZHQtYmluZGluZ3M6IGh3bW9uOiBwbWJ1czoNCj4g
YWRwMTA1MCA6IGFkZCBiaW5kaW5ncw0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24gMTkvMDMv
MjAyNCAxMjozMiwgUmFkdQ0KPiBTYWJhdSB3cm90ZToNCj4gPiBBZGQgZHQtYmluZGluZ3MgZm9y
DQo+IGFkcDEwNTAgZGlnaXRhbCBjb250cm9sbGVyIGZvcg0KPiBpc29sYXRlZCBwb3dlciBzdXBw
bHkNCj4gPiB3aXRoIHBtYnVzIGludGVyZmFjZQ0KPiB2b2x0YWdlLCBjdXJyZW50IGFuZA0KPiB0
ZW1wZXJhdHVyZSBtb25pdG9yLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmFkdSBTYWJhdQ0K
PiA8cmFkdS5zYWJhdUBhbmFsb2cuY29tPg0KPiANCj4gVGhpcyBpcyBhIGZyaWVuZGx5IHJlbWlu
ZGVyDQo+IGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuDQo+IA0KPiBOb3RoaW5nIGNoYW5nZWQs
IGFic29sdXRlbHkNCj4gbm90aGluZy4NCj4gDQo+IEl0IHNlZW1zIG15IG9yIG90aGVyDQo+IHJl
dmlld2VyJ3MgcHJldmlvdXMNCj4gY29tbWVudHMgd2VyZSBub3QgZnVsbHkNCj4gYWRkcmVzc2Vk
LiBNYXliZSB0aGUNCj4gZmVlZGJhY2sgZ290IGxvc3QgYmV0d2Vlbg0KPiB0aGUgcXVvdGVzLCBt
YXliZSB5b3UNCj4ganVzdCBmb3Jnb3QgdG8gYXBwbHkgaXQuIFBsZWFzZQ0KPiBnbyBiYWNrIHRv
IHRoZSBwcmV2aW91cw0KPiBkaXNjdXNzaW9uIGFuZA0KPiBlaXRoZXIgaW1wbGVtZW50IGFsbA0K
PiByZXF1ZXN0ZWQgY2hhbmdlcyBvciBrZWVwDQo+IGRpc2N1c3NpbmcgdGhlbS4NCj4gDQo+IFRo
YW5rIHlvdS4NCg0KSW5kZWVkIEkgZm9yZ290IHRvIGFkZHJlc3MgZmV3IGNvbW1lbnRzIHJlZ2Fy
ZGluZyBkdC1iaW5kaW5ncw0KYW5kIEkgYW0gdmVyeSBzb3JyeSBmb3IgdGhhdCwgd2lsbCBtYWtl
IHN1cmUgdG8gYWRkcmVzcyB0aGVtDQppbiB0aGUgbmV4dCBwYXRjaC4NCg0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K

